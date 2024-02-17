//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library EnclaveIdStruct {
    struct EnclaveId {
        uint8 miscselect;
        uint8 miscselectMask;
        uint16 isvprodid;
        bytes16 attributes;
        bytes16 attributesMask;
        bytes32 mrsigner;
        TcbLevel[5] tcbLevels;
    }

    struct TcbLevel {
        uint16 isvsvn;
        EnclaveIdStatus tcbStatus;
    }

    enum EnclaveIdStatus {
        OK,
        SGX_ENCLAVE_REPORT_ISVSVN_REVOKED
    }
}
