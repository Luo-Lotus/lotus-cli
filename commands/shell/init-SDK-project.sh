#!/bin/bash
npm install rn_request_ability
mkdir src
mkdir test
mkdir src/constant
mkdir src/api
mkdir src/entity
cat>src/entity/$1.js<<EOF
export default class $1 {
    constructor({}) {

    }
}

EOF
cat>src/constant/ApiInfo.js<<EOF
export default {
    API_DOMAIN: 'https://65.jp-tokyo.api.staging.laiwan.shafayouxi.com/',
};

EOF
cat>src/constant/ApiVersion.js<<EOF
export default {
    V1: 'v1',
    V2: 'v2',
    V3: 'v3',
    V4: 'v4',
    V5: 'v5',
};

EOF
cat>src/constant/UserInfo.js<<EOF
export default {
    AUTHORIZATION: 'bearer 7gnZqMRfqeQ5RKTWkHg20Ej8iCb7LTfI',
};

EOF

cat>src/api/Remote$1.js<<EOF
import RequestAbility from 'rn_request_ability';
import ApiVersion from '../constant/ApiVersion';

export default class Remote$1 extends RequestAbility {
    constructor(apiDomain, authorization) {
        super(apiDomain, authorization);
        this.setHeader({
            Authorization: authorization,
        });
    }

    setHeader(header) {
        this.header = header;
    }

    getHeader() {
        return this.header;
    }
}

EOF

cat>src/$1SDK.js<<EOF
import Remote$1 from './api/Remote$1';
import $1 from './entity/$1';

export default class $1SDK {
    constructor(apiDomain, authorization) {
        this.Remote$1 = new Remote$1(
            apiDomain,
            authorization
        );
    }
}

EOF
cat>test/$1.test.js<<EOF
import $1SDK from '../src/$1SDK';
import ApiInfo from '../src/constant/ApiInfo';
import UserInfo from '../src/constant/UserInfo';

describe('', () => {
    const $1SDK = new $1SDK(
        ApiInfo.API_DOMAIN,
        UserInfo.AUTHORIZATION
    );

});

EOF