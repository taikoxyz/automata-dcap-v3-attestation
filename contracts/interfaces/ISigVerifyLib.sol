//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

interface ISigVerifyLib {
    enum KeyType {
        RSA,
        ECDSA
    }

    struct PublicKey {
        KeyType keyType;
        // If RSA, pubKey = abi.encodePacked(exponent, modulus)
        // If ECDSA, pubKey = abi.encodePacked(gx, gy)
        bytes pubKey;
    }

    enum CertSigAlgorithm {
        Sha256WithRSAEncryption,
        Sha1WithRSAEncryption
    }

    struct Certificate {
        // Asn.1 DER encoding of the to-be-signed certificate
        bytes tbsCertificate;
        PublicKey publicKey;
        bytes signature;
        CertSigAlgorithm sigAlg;
    }

    enum Algorithm {
        RS256,
        ES256,
        RS1
    }

    // Verifies the signature of an attestation statement (tbs) using a given public key and algorithm.
    function verifyAttStmtSignature(bytes memory tbs, bytes memory signature, PublicKey memory publicKey, Algorithm alg)
        external
        view
        returns (bool);

    // Verifies the signature of a certificate (tbs) using a given public key and certificate signature algorithm.
    function verifyCertificateSignature(
        bytes memory tbs,
        bytes memory signature,
        PublicKey memory publicKey,
        CertSigAlgorithm alg
    ) external view returns (bool);

    // Verifies the RS256 signature of a message using a given public key.
    function verifyRS256Signature(bytes memory tbs, bytes memory signature, bytes memory publicKey)
        external
        view
        returns (bool sigValid);

   // Verifies the RS1 signature of a message using a given public key.
    function verifyRS1Signature(bytes memory tbs, bytes memory signature, bytes memory publicKey)
        external
        view
        returns (bool sigValid);
    // Verifies the ES256 signature of a message using a given public key.
    function verifyES256Signature(bytes memory tbs, bytes memory signature, bytes memory publicKey)
        external
        pure
        returns (bool sigValid);
}
