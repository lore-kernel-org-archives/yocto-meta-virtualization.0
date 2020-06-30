Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web10.17725.1593595399572275642
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Jul 2020 02:23:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="crypto/rsa: verification error" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=imt1hQN3;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id d15so18974402edm.10
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Jul 2020 02:23:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:resent-from:resent-date:resent-message-id
         :resent-to:dkim-signature:dkim-signature:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:user-agent:nodisclaimer:content-id
         :content-transfer-encoding:mime-version
         :original-authentication-results;
        bh=HtaqkVhFWdv9CjNybPcQtEOSs8ExEuTXsTiQQyYFn4k=;
        b=tsTy8SfZ4QfjWbhR7qvAQ20+ab1XsJryeCc6RWHphCx7Cz7JE4AfgP7X1s7dHhVg65
         kMmhltmxpG9lEMEnBLPizzrB6r0M2FcTFQZCmxBsuOzEx79YwXkeIRmKkwge64BcNF77
         JcPCK7OITMSjXyRpUPfYG9Np2gZ3xhbs0/tfcLWV3/NBhy+ximQlxAmqDcCtor/dUb7t
         Rzd29cUIvKPqhd5CO8iPVnj0CrMqISXzsN8Ff6k+4BzJTfwipwlGCCK1gejxROCXimQL
         vxOH+Q05Nyg6b7nbH+YWLxUo0/VMEoLlfwFCyQz+R9za0IaLqTH34Zsg7rOak1tbiuEr
         3rKQ==
X-Gm-Message-State: AOAM533INEc4PLI8TTFCyvJPSOBTnLY9J5Yef1ZzeVcRV/+BfrmGG52P
	L6kqTduR7ppkWX80/z7yeoshhLa2
X-Google-Smtp-Source: ABdhPJzBz9NMTunAVxtMPAErGKAgytU6k/quLUj8n1qXR/6QyoE8yJ8O5kk6al/Y6Xi/sKKG8wx23A==
X-Received: by 2002:a05:6402:22c1:: with SMTP id dm1mr15080820edb.187.1593595397868;
        Wed, 01 Jul 2020 02:23:17 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id d12sm5864830edx.80.2020.07.01.02.23.17
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 02:23:17 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Ross Burton <Ross.Burton@arm.com>
Resent-From: Martin Jansa <Martin.Jansa@gmail.com>
Resent-Date: Wed, 1 Jul 2020 11:23:17 +0200
Resent-Message-ID: <20200701092317.jhm344balm2yy2qv@jama>
Resent-To: meta-virtualization@lists.yoctoproject.org
Received: by 2002:aa7:c143:0:0:0:0:0 with SMTP id r3csp2628586edp;
        Tue, 30 Jun 2020 05:54:07 -0700 (PDT)
X-Received: by 2002:a17:906:c415:: with SMTP id u21mr17931279ejz.45.1593521647903;
        Tue, 30 Jun 2020 05:54:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593521647; cv=pass;
        d=google.com; s=arc-20160816;
        b=nAcwLwXIIJitTGHeXvpcw1+D04WXS97V2DB4HZcbI3Ascn92Qcp5lEzYXtfidXRi6N
         4E0rnlncg0mYC1JKJl4NDeahuHiet7X6l5XV0LCd4P3Ef6ehENXk0FMXY2S+pEnHmqlx
         ZMEawmdyipAL3Kv54jP0u1Sr5M1rMO/1X+CcYM0hyJUThIk9V0yRiPrkktT6vOnAxmbT
         agGaescRgx7GbVoWMKehWXtW4xAcs8xnkPrYWyqv3yCkyIuyXzWytIaUqfmLQTaD/2ux
         vKNuFlkRc/Hdefrgyx3xK0YBH4JR5uW9MuZRP/TcQlBlCtXNTlB9SBbICdYP7N8i9qyL
         rmLw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=original-authentication-results:mime-version
         :content-transfer-encoding:content-id:nodisclaimer
         :authentication-results-original:user-agent:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=HtaqkVhFWdv9CjNybPcQtEOSs8ExEuTXsTiQQyYFn4k=;
        b=DggAy6ddyY2h4YPqNLQuaAI+qspfS11DIgHqy6Eeqyd1ovjImoEV/Ge1Rb622Z8u6e
         pxehslbCBFPiHIztOTmE0kwdvRjK46KE7VE2xXJWzJwAPkUav734d1ioPR9t8LRRzFNk
         EvXSWSlKA76IJVkCVfQeFEBuhUSjLnQGo1IOWLEHmd3L9mTVKJzvOYPGaI/bu/W7iEWv
         y3cxLWmdbKayRtDErAos01AftYfdyXqNyvNdiUa2BOJIMUo6pI+4rF5d/f7S1z1eMMCI
         naK9Xa9jhkKNtfMRxMXnFqM2zq9AqiR28eCRnimJeCz1/nmgqSi4fvzOLL3ZzuNaZ4CX
         diMw==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=imt1hQN3;
       dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=imt1hQN3;
       arc=pass (i=1 spf=pass spfdomain=arm.com dkim=pass dkdomain=arm.com dmarc=pass fromdomain=arm.com);
       spf=pass (google.com: domain of ross.burton@arm.com designates 40.107.21.83 as permitted sender) smtp.mailfrom=Ross.Burton@arm.com
Return-Path: <Ross.Burton@arm.com>
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2083.outbound.protection.outlook.com. [40.107.21.83])
        by mx.google.com with ESMTPS id n24si1643663edt.561.2020.06.30.05.54.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Jun 2020 05:54:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of ross.burton@arm.com designates 40.107.21.83 as permitted sender) client-ip=40.107.21.83;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HtaqkVhFWdv9CjNybPcQtEOSs8ExEuTXsTiQQyYFn4k=;
 b=imt1hQN3qexOnZCknReGWljixq6yw/C5/7JmMe8vx4EgPfV/UqIqEmQiJVhfGGM/UgWrPRWtfspm/QpmKZjg0QOxFFCVzTsUDkufLYXzdgl98+TL34Hltz+JmNJT6KBNFrLq5OCIkE0R9sW+r06mrR67wn75Qzu/dM1+dijtgV8=
Received: from DB6PR07CA0104.eurprd07.prod.outlook.com (2603:10a6:6:2c::18) by
 AM6PR08MB4263.eurprd08.prod.outlook.com (2603:10a6:20b:b7::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.24; Tue, 30 Jun 2020 12:54:06 +0000
Received: from DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2c:cafe::43) by DB6PR07CA0104.outlook.office365.com
 (2603:10a6:6:2c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.11 via Frontend
 Transport; Tue, 30 Jun 2020 12:54:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; gmail.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;gmail.com; dmarc=bestguesspass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT031.mail.protection.outlook.com (10.152.20.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.20 via Frontend Transport; Tue, 30 Jun 2020 12:54:06 +0000
Received: ("Tessian outbound c282746a06a7:v60"); Tue, 30 Jun 2020 12:54:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: aa864c35f24833de
X-CR-MTA-TID: 64aa7808
Received: from 6b386329da38.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 76FDA6D5-37B4-4033-A080-C3F0103242A3.1;
	Tue, 30 Jun 2020 12:54:01 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6b386329da38.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 30 Jun 2020 12:54:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ClmAPsMI9PbWIg50NVAq9NDiZzM6SHZORGuVPaJJrtLiPA/bfgKNfe468gZXrpfoqRSjFHBKJM7jLIT6L2JPc7ZvR4u/mjqre6G8oe/SyAO8+T/AtVoUJf3mBUWO7kC8Wydwo1JMbV3tudIfRbzn6HiFcWY3/hSW0vhCBhse9NJABjhAkTNOH3wZ+uz6NlS1x/91IN2KvmmAyoUDoex5q/RspadwUA0Y7hbaDtjvxQWSXgr8HCl5p1/BqTJoGyaqJTdiir3mL0lXUVOCysvGdgRvCZCm4J9ZTCRNtL0vIxt0w3CZ8vGNLPGcJXDN3r23ZtqXPy+6HKQy7IkDdSUzPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HtaqkVhFWdv9CjNybPcQtEOSs8ExEuTXsTiQQyYFn4k=;
 b=BYDzw1LlyxIUf7TwCBT0BLs20F1/lZjJ0iFpEXctR1OCrNuwhr3Y5Tyx2ojXiiE1kkfBGLvB3LdMioacuCY8GlibeKrECTSnU/O/gwHoEiD3dLF01yEnpGaNU7MZnzmYaPIHWye6iYnRwsQw+KdMpbmCW8pzEF3eggRg0G8Nxz5XaeLZ1G9sjR5q7FJb8QaYI65jdYjAA1+vnGbgw+nmhqDiW6ZT3jYK+gKn63ZNjSJQZO+FpAMTrdP0oFEISzZW6iewVh8wQCzaTmcS3SqjYjkaESIbuo5m5QWxBr6u9cUTn5ZOjL7zMrwVXw80s13bkV/vOyneIBfRVLs/76iz+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HtaqkVhFWdv9CjNybPcQtEOSs8ExEuTXsTiQQyYFn4k=;
 b=imt1hQN3qexOnZCknReGWljixq6yw/C5/7JmMe8vx4EgPfV/UqIqEmQiJVhfGGM/UgWrPRWtfspm/QpmKZjg0QOxFFCVzTsUDkufLYXzdgl98+TL34Hltz+JmNJT6KBNFrLq5OCIkE0R9sW+r06mrR67wn75Qzu/dM1+dijtgV8=
Received: from VI1PR0801MB1678.eurprd08.prod.outlook.com
 (2603:10a6:800:51::23) by VI1PR0802MB2191.eurprd08.prod.outlook.com
 (2603:10a6:800:a1::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Tue, 30 Jun
 2020 12:53:59 +0000
Received: from VI1PR0801MB1678.eurprd08.prod.outlook.com
 ([fe80::5cd2:4149:dd08:712]) by VI1PR0801MB1678.eurprd08.prod.outlook.com
 ([fe80::5cd2:4149:dd08:712%10]) with mapi id 15.20.3131.028; Tue, 30 Jun 2020
 12:53:59 +0000
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Martin Jansa
	<martin.jansa@gmail.com>
CC: Ming Liu <liu.ming50@gmail.com>, Stefan Agner <stefan.agner@toradex.com>,
	Ming Liu <ming.liu@toradex.com>
Subject: Re: [meta-virtualization][PATCH] docker-moby: update to v19.03.12
Thread-Topic: [meta-virtualization][PATCH] docker-moby: update to v19.03.12
Thread-Index: 
 AQHWS95xidjMyyP4aUKi0F6sAdcQuqjrK6tkgAABzoCAAFEo74AAJBUAgANE9YCAAHKGgIAAMBuAgAGUbgCAAAHNgIAAAQSAgAAShQA=
Date: Tue, 30 Jun 2020 12:53:59 +0000
Message-ID: <ABA1710E-FD64-4F28-82D4-EC375EB1EA31@arm.com>
References: <20200626161705.32600-1-liu.ming50@gmail.com>
 <CA+chaQei6WPUNkN0OOkk+MxEsWmnPSkTBAnrUq9KLbXmx87y1g@mail.gmail.com>
 <161C28A10F0C0173.4849@lists.yoctoproject.org>
 <CADkTA4NCh2F1=-aX7zwOaZvEC1as-r7=s=+C3HoWNr7MwyGh=A@mail.gmail.com>
 <CA+chaQemwGtgKjGqbdnaeEVG7st0QoM3o1JwppiVFY=2Hx6D4A@mail.gmail.com>
 <161C29D35303F5F1.8018@lists.yoctoproject.org>
 <CADkTA4OGYEC2=wuMfY4adbn2V4oyH02oac_=TqCURZUuY=pkTA@mail.gmail.com>
 <CA+chaQejB_++EQN4SX_R1PfXGOb=HSpQy9EtOPQe4SxVDXDSUA@mail.gmail.com>
 <CADkTA4OfHD+tV1d920bkY0pp=+ArRVDUmBhAejySHOmmb7Zs9A@mail.gmail.com>
 <619B9396-3C30-422E-ADF6-06A05B7EB2F9@arm.com>
 <CADkTA4PDkvqZcktkx1+RY--zV5JWK1WmspuJdWQ_js+jjuOVRA@mail.gmail.com>
 <CADkTA4M7kUqBGW52YWSK4+gQoH7n5P1Rdwd3RRENJXv_2YiVtA@mail.gmail.com>
 <CA+chaQdAqpF=uOCdnXVqUghMRtNj9NtweLf+NwPZG5vaq+PfLw@mail.gmail.com>
 <CADkTA4OxzRm6siKyqxxqdHSF+gwrQfcG-g3cYWCVYBezgvubQg@mail.gmail.com>
In-Reply-To: 
 <CADkTA4OxzRm6siKyqxxqdHSF+gwrQfcG-g3cYWCVYBezgvubQg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.38.20061401
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9f545686-86e5-43f5-f2ea-08d81cf4aca0
x-ms-traffictypediagnostic: VI1PR0802MB2191:|AM6PR08MB4263:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB42630F5D67EC485831F6807CE86F0@AM6PR08MB4263.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2043;OLM:5516;
x-forefront-prvs: 0450A714CB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 JbBrIm5iBVN/ZQYgdOJtI9M67q47qr2Whz6UK2Fa2ogi2FQaNzWOibXOk0bPOIQC/wmxyQAHyQ5jQ0Z1U9jIL9IwH6Ks18YlWoQCI7ynmgHYQKzu3TYY0FnX1YM6TAbHyEtVFKFEeVEWmjTLJfyVXdaYjSzbTZSGOfv5AS/6iX7vemoszu4beqYnkChoohpr0uSFmGRfOFsvlzY/Hbbl5m55jVYKj69jOonv/g7HDGkPCS9VJrrxpjpKdeNsQifyR8Uy4jtC5yepap63p0qA/KHCkWhpoAdnuASTGmkMRZbQPFVvgkXFtXTA8QVRBcNnKoTp9IES4W40JAml+tIQrThPv5SKT8rDk0Yjo5WIrXES9cbpjqvHtJcNzv9WFwEydnZprUgJetS8Y1kI4FWQPQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0801MB1678.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(136003)(366004)(39860400002)(396003)(76116006)(86362001)(966005)(478600001)(36756003)(53546011)(110136005)(33656002)(6506007)(6486002)(54906003)(316002)(4326008)(186003)(26005)(4744005)(8676002)(64756008)(66946007)(91956017)(83380400001)(66556008)(66476007)(66446008)(8936002)(6512007)(15650500001)(2906002)(2616005)(71200400001)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 rYlkGx/RHZwIR/GQIKPBl0FSEwUaAWq1e6nKeEWHrsys9kg7JdXcWwNbhWEjzE472zmMLLKVsr+otMktYdffArSE+DTjlZ1djAEYSCqxND9kesMOoix/J7i4HH3ZHoyzv2GjuO5YCPjqx+kjOOmN+Sx0I2YAtqLoigXMj4dHcG76tJ+oQYogeM2oS3K5vGYaHc17zMFF2FXN1YjWTiefx3p7gCz0Xu3L1p0hBa57cOtw2+IJlOBQBGM5sm7NR6Yuc04ya7IRf9ga0S/6r1cHEGcCyI7l/UT52YJFQwkdKQ89dhUekqt0JO9G3wB1g2e7PQjAiYjOTYOKHaIeR6MQouSW9+IEOEUs6KX5RX7DEYRsSDOnJUeJsCfnPBsDAwDlJuVGoIGqYZVDXqBXxA0qCgqeaKVGDHSErxe3BM7uT9Yx+LsWD5CILI0ccpw2mApeePjHYJzniPmClgelW9U9XBjIBHFaOlqMK0P2nQNC8Rp7202t6P1qi+/mT2jx+1Wt
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2191
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Ross.Burton@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(376002)(346002)(136003)(39860400002)(46966005)(36756003)(70586007)(70206006)(2616005)(33656002)(82740400003)(8676002)(53546011)(6506007)(966005)(5660300002)(186003)(2906002)(478600001)(54906003)(316002)(86362001)(110136005)(6512007)(26005)(81166007)(82310400002)(4326008)(15650500001)(47076004)(4744005)(83380400001)(450100002)(356005)(107886003)(336012)(6486002)(8936002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	53652b22-c9b1-4d56-b5c0-08d81cf4a855
X-Forefront-PRVS: 0450A714CB
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	C0GgmjcheZ8Mbj4NcJWaooUsKhjdSy3+Xb3XbVRLa7zNrwGSaGI3rHi6/eTcr/GUZLjstLM+2CLm4qJRbOZHg/I+9673AkCCbMf2YtQYz0nqGKm4ojoW+LvxovD/NHaOF147S9ZC4ik7Yxxom3Dcbfa6U1Ku7L4IpO++F0DDHMUOgXbTpLU4JoWACArIQ+21nayUlRh4a9W/d04YDkG2nLGl1x1hE0tGWxU3kFH+aH/4JxmFa/wcitaBk2c6JgJZNPc2jgSSjsnNb5/R1mJD+/wDOpUe14S8WcnuKUHyi7VB9N7Dhd2QyWqVumhM6ztp82pfyFrMLKoxAt2DueSuWxMVjLr2maQNTBpmDyqDKSqCz0+SNWrflAMUYRsPzLa8T3WScPQdAz0631xacwb/Yf6St10CsP8eaLnggVI7nI5R4y1x/RpidJcCRZu1f3EdYRkdyeEjfv4PbHeKHgsWIBDKy1HTmY+I+D8FeKjtt2o=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2020 12:54:06.6632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f545686-86e5-43f5-f2ea-08d81cf4aca0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4263
X-TUID: HKC1E6vSiTps
Content-Language: en-GB
Content-Type: text/plain; charset="utf-8"
Content-ID: <2CD19543F5057841963317B0F8984735@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gMzAvMDYvMjAyMCwgMTM6NDgsICJCcnVjZSBBc2hmaWVsZCIgPGJydWNlLmFzaGZpZWxkQGdt
YWlsLmNvbT4gd3JvdGU6DQoNCiAgICBPbiBUdWUsIEp1biAzMCwgMjAyMCBhdCA4OjQ0IEFNIE1h
cnRpbiBKYW5zYSA8bWFydGluLmphbnNhQGdtYWlsLmNvbT4gd3JvdGU6DQogICAgPg0KICAgID4g
SGksDQogICAgPg0KICAgID4gdGhhbmtzIGZvciB3b3JraW5nIG9uIHRoaXMuIEknbSBzdGlsbCBk
b24ndCBrbm93IGFueXRoaW5nIGFib3V0IGdvbGFuZyBpbiBPRSwgYnV0IGZyb20gZWFybGllciBw
b3N0IGZyb20gUm9zczoNCiAgICA+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29w
ZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMTM5NDM3P3A9LCwsMjAsMCwwLDA6OkNyZWF0ZWQsLGdv
LDIwLDIsNDAsNzQ4MzgwMjcNCiAgICA+IGl0IHNvdW5kcyBsaWtlIHRoZXNlIHJlY2lwZXMgc2hv
dWxkbid0IGJlIHVzaW5nIGdvLW5hdGl2ZS1iaW5hcnksIGJ1dCBnby1jcm9zcy0ke1RVTkVfUEtH
QVJDSH0gd2hpY2ggaXNuJ3QgcHJlYnVpbHQgYW5kIHdpbGwgcHJvYmFibHkgcG9pbnQgdG8gdGhl
IHJpZ2h0IGhlYWRlciBmaWxlcyBpbiBPRSBzeXNyb290Lg0KDQpSaWdodCwgdXNlIHRoZSBjcm9z
cyBHbywgZXZlbiB0aG91Z2ggdGhleSdyZSBtZWFudCB0byBiZSB0aGUgc2FtZS4NCg0KUm9zcw0K
DQoNCklNUE9SVEFOVCBOT1RJQ0U6IFRoZSBjb250ZW50cyBvZiB0aGlzIGVtYWlsIGFuZCBhbnkg
YXR0YWNobWVudHMgYXJlIGNvbmZpZGVudGlhbCBhbmQgbWF5IGFsc28gYmUgcHJpdmlsZWdlZC4g
SWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwgcGxlYXNlIG5vdGlmeSB0aGUg
c2VuZGVyIGltbWVkaWF0ZWx5IGFuZCBkbyBub3QgZGlzY2xvc2UgdGhlIGNvbnRlbnRzIHRvIGFu
eSBvdGhlciBwZXJzb24sIHVzZSBpdCBmb3IgYW55IHB1cnBvc2UsIG9yIHN0b3JlIG9yIGNvcHkg
dGhlIGluZm9ybWF0aW9uIGluIGFueSBtZWRpdW0uIFRoYW5rIHlvdS4NCg==
