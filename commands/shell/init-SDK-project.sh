#!/bin/bash
npm install rn_request_ability
mkdir src
mkdir test
mkdir src/constant
mkdir src/api
mkdir src/service
mkdir src/entity
cat>src/entity/$1.js<<EOF
export default class $1 {
    constructor({}) {

    }
}

EOF
cat>src/constant/ApiInfo.js<<EOF
export default Object.freeze({
    API_DOMAIN: 'https://65.jp-tokyo.api.staging.laiwan.shafayouxi.com/',
});

EOF
cat>src/constant/ApiVersion.js<<EOF
export default Object.freeze({
    V1: 'v1',
    V2: 'v2',
    V3: 'v3',
    V4: 'v4',
    V5: 'v5',
});

EOF

cat>src/constant/SystemInfo.js<<EOF
export default Object.freeze({
    DEVICE_ID: 'fa707d62-2865-44d6-aad4-69c7b7cb14c5',
    APP_ID: 'laiwan',
    LANGUAGE: 'en',
});

EOF

cat>src/constant/UserInfo.js<<EOF
export default Object.freeze({
    AUTHORIZATION: 'bearer ac1OGLABIsPYJRJVTtqdsOhSQcRE4BEk',
});

EOF

cat>src/api/$1API.js<<EOF
import { DeserializeRequestAbility } from 'rn_request_ability';

export default class $1API extends DeserializeRequestAbility {
}

EOF

cat>src/$1SDK.js<<EOF
import $1API from './api/$1API';
import $1 from './entity/$1';

export default class $1SDK {
    constructor(apiDomain, authorization, appId, sysLanguage) {
        this.apiDomain = apiDomain;
        this.authorization = authorization;
        this.headerFactory = new RequestAbilityHeaderFactory({
            appId,
            sysLanguage,
        });
    }

    get$1API() {
        return new $1API(
            this.apiDomain,
            this.authorization,
            this.headerFactory
        );
    }
}

EOF
cat>test/$1.test.js<<EOF
import $1SDK from '../src/$1SDK';
import ApiInfo from '../src/constant/ApiInfo';
import UserInfo from '../src/constant/UserInfo';
import SystemInfo from '../src/constant/SystemInfo';

describe('', () => {
    const { APP_ID, LANGUAGE } = SystemInfo;
    const $1SDK = new $1SDK(
        ApiInfo.API_DOMAIN,
        UserInfo.AUTHORIZATION
        APP_ID,
        LANGUAGE
    );
});

EOF