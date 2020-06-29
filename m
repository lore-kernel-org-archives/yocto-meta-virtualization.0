Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web11.17530.1593595383587481408
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Jul 2020 02:23:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="crypto/rsa: verification error" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=OpxDLWL9;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id a1so23768698ejg.12
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Jul 2020 02:23:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:resent-from:resent-date:resent-message-id
         :resent-to:dkim-signature:dkim-signature:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:user-agent:nodisclaimer:content-id
         :content-transfer-encoding:mime-version
         :original-authentication-results;
        bh=Vcxyhu6oTfIr9GfdvR2WJRTTAVEf+k5s4xE0rK+bdZU=;
        b=SfYQlthRSe31aCxlbnOLoCmA02vN43I7iFaQsUMsnNeJPQE28HWRCmOhcS3cUrL2zK
         /zH6g5g/Rp3uX5O95dR6ZbUcQHXbZM8hQfY8vuWh4OA2fr79g9YE2CsTL6tk4vtPd5P3
         1V7ODAQEDUs0NqFbFSg7q6wxvE2g3XVoNqQT53CFdAYbrvx1RK9wsyoqU6Xv0gV9R6+S
         fi8fczVtIafiKyLojw+trCK5aYs6+/To661eFYv3+Qeodt11JHB7rG9/mzZjoEnz7MBa
         7bqFkJDU1TyDylRGOyMep/ZwTEUu2S6sIukHD8FAA/QGgHubfH6wgq8DbRs1tZN4ee3A
         F//Q==
X-Gm-Message-State: AOAM5329B1F8GkFi13St2PVXvvH7OYDns0pdM4IVmD5M+iwETNiuICDt
	q/g/rv8MjafGsf0Prg35vgQSFxRx
X-Google-Smtp-Source: ABdhPJy3pTJf9rc/bwzx/ENY6KtwTuITytj94p4FmEQYc/NOGSpd20DB+aUnwIQKM72aoL4YDI7qoA==
X-Received: by 2002:a17:906:1254:: with SMTP id u20mr1736704eja.540.1593595381862;
        Wed, 01 Jul 2020 02:23:01 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id f16sm4253326ejr.0.2020.07.01.02.23.01
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 02:23:01 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Ross Burton <Ross.Burton@arm.com>
Resent-From: Martin Jansa <Martin.Jansa@gmail.com>
Resent-Date: Wed, 1 Jul 2020 11:23:01 +0200
Resent-Message-ID: <20200701092301.wtyt243cql2nnyty@jama>
Resent-To: meta-virtualization@lists.yoctoproject.org
Received: by 2002:aa7:c143:0:0:0:0:0 with SMTP id r3csp1578541edp;
        Mon, 29 Jun 2020 01:38:08 -0700 (PDT)
X-Received: by 2002:a05:620a:6c8:: with SMTP id 8mr14179494qky.396.1593419888627;
        Mon, 29 Jun 2020 01:38:08 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593419888; cv=pass;
        d=google.com; s=arc-20160816;
        b=hmOYUU9LHTWPnoYIcjErgD9Z9MP+85zg6/48k21qvCSV/uq1KV8Kb/89hoiTUK08Ej
         rBVQNGuUdkzkkqzacRC6o9X6CBHlXO+ToFjeNCDJk/qLS7kPqBv4BnCZLj8UaUGwIupq
         lXdx4N5nFRfuwDzyH83vLEq6IY50Cr1EQdMKLPKhPMqwI9Iv5bG0bpAGOaX8DGbw8Pc2
         UnqKOyqQxnh6mMxeiMY+b7qp6Xz680LOFUonY7wyLtURO/i+BEKZ9O+dqYEl4ngHGT4J
         DwvCUS32u0ko9QjN7pXnFZu6PJ2KsOA4xRTEa0r0hUl/6GqvbxVC7bsH6v0jPB9V5jjh
         W7Pw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=original-authentication-results:mime-version
         :content-transfer-encoding:content-id:nodisclaimer
         :authentication-results-original:user-agent:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=Vcxyhu6oTfIr9GfdvR2WJRTTAVEf+k5s4xE0rK+bdZU=;
        b=NQwfrivW1eEIp5EOM6ASS2meWi7dP86429eD/peferQ/Go586T1lm5i1muGYwEuD7a
         M08O9x9MnVrccQx7WLhMB6sDRlqI2WKCcYKVd5n2Gx05Iug6ptHxc9TamLP9iYdOCe6R
         s1nmFMLMYRqxNyFZUc2pbaNQ/vUEclyK9waDm/HrwEZGvdg67oKma2f0jY44NI29UK9+
         yfb1hQEkc/dvO1uU0chrNpUYwsepSsf4b/SWa+ea+qpubfrpxPtK+Pzzbk4257Y3cAZ/
         QDq8O4sLcN9wU+c5Oq/Ii9SziEo7ixxANlpk5kGReb1sAF+uj7QZj90E1B8Ol5iyVxUh
         Akng==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=OpxDLWL9;
       dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=OpxDLWL9;
       arc=pass (i=1 spf=pass spfdomain=arm.com dkim=pass dkdomain=arm.com dmarc=pass fromdomain=arm.com);
       spf=pass (google.com: domain of ross.burton@arm.com designates 40.107.7.70 as permitted sender) smtp.mailfrom=Ross.Burton@arm.com
Return-Path: <Ross.Burton@arm.com>
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70070.outbound.protection.outlook.com. [40.107.7.70])
        by mx.google.com with ESMTPS id d5si5124397qvs.180.2020.06.29.01.38.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jun 2020 01:38:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of ross.burton@arm.com designates 40.107.7.70 as permitted sender) client-ip=40.107.7.70;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vcxyhu6oTfIr9GfdvR2WJRTTAVEf+k5s4xE0rK+bdZU=;
 b=OpxDLWL93iM+TnYXtAjxu0BA/fNCJpjTwK31yA5iDHpXK2QK9xqBMLRj7RbE2vhPxPhP0iXRdicwfTyZ/pfAt2EK3BsV/WPtJLZHPg6tGx3MnCxMpaEYTL1OX3JeMhJ21Huz6zTl4AVPHCnxi5VgwBxCH3Sz3VESCShoUyvhjzs=
Received: from AM6P195CA0004.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::17)
 by DB8PR08MB5513.eurprd08.prod.outlook.com (2603:10a6:10:f8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.23; Mon, 29 Jun
 2020 08:38:04 +0000
Received: from AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::11) by AM6P195CA0004.outlook.office365.com
 (2603:10a6:209:81::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend
 Transport; Mon, 29 Jun 2020 08:38:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; gmail.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;gmail.com; dmarc=bestguesspass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT006.mail.protection.outlook.com (10.152.16.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.20 via Frontend Transport; Mon, 29 Jun 2020 08:38:04 +0000
Received: ("Tessian outbound 4df70ead97c2:v60"); Mon, 29 Jun 2020 08:38:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b903092eefbc8a86
X-CR-MTA-TID: 64aa7808
Received: from 0b4be87a14d2.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 83508D22-4408-4E08-B26B-3FDF38AEA8B4.1;
	Mon, 29 Jun 2020 08:37:58 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0b4be87a14d2.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 29 Jun 2020 08:37:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=griV7Osa9TRztX+qXILDXbAaE91qrzJTfVZHCvPcOjmvo5o2baWijQQ+SM/oHUd4ve1gFqpQ7/hGNxCsC+dkuFcZSLCg8CTKZ9r1fxGhTFlvg2uQfSRcfi2oN30GbR8rMLa7qM+3XTTYKHIeW/GwTKcoiqumSyZYV5/NrlOXpdxntxUSN2lgNSJb3jmcUjZsOR6NiDAA0Lxk7nCSwptSaOjj3Zb6Lbprxayeps8df2+V68Mizta5HfGqQ+mvlEHlOr4Bd0X+ve+KNUOgkSlBNUEWfyKsttd7fWIwJS374X07bM4F8F+Di3+/UBfyu78iY0IZWiICysaU9k8adTzxsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vcxyhu6oTfIr9GfdvR2WJRTTAVEf+k5s4xE0rK+bdZU=;
 b=jskj6zmI6USkA8ILNs52ISe/JLY3Lpj5oz6vrsddPC3Vx0BG9XykZhgCLwnV4qrdjo4FhLPaN9SiJRvYtQxWSUk9504UOhJlgSqR5U7oeD1X2f//Dml250o6wWfzzurarvJ/9CzxYNIhqljczJF8M2pP8EZrZvbQeUDGzb9PpQTIYWOG5yTSXa1ZP8cO/utc75pgcFShqg2q5peSgBEtssDn0Lw60zK9bfSWr85Z3VAd1SDoY6H+wmzVkBZ7+8+R+Ea3dJ+Eggvg7jjmW6akPTH8r+59rVVDuxMQXQdaYtFkVuSFlnKWf0P8flnOhyhSc5uozAr2QXGJYa+60D/DMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vcxyhu6oTfIr9GfdvR2WJRTTAVEf+k5s4xE0rK+bdZU=;
 b=OpxDLWL93iM+TnYXtAjxu0BA/fNCJpjTwK31yA5iDHpXK2QK9xqBMLRj7RbE2vhPxPhP0iXRdicwfTyZ/pfAt2EK3BsV/WPtJLZHPg6tGx3MnCxMpaEYTL1OX3JeMhJ21Huz6zTl4AVPHCnxi5VgwBxCH3Sz3VESCShoUyvhjzs=
Received: from VI1PR0801MB1678.eurprd08.prod.outlook.com
 (2603:10a6:800:51::23) by VI1PR08MB4574.eurprd08.prod.outlook.com
 (2603:10a6:803:e3::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.25; Mon, 29 Jun
 2020 08:37:55 +0000
Received: from VI1PR0801MB1678.eurprd08.prod.outlook.com
 ([fe80::5cd2:4149:dd08:712]) by VI1PR0801MB1678.eurprd08.prod.outlook.com
 ([fe80::5cd2:4149:dd08:712%10]) with mapi id 15.20.3131.026; Mon, 29 Jun 2020
 08:37:55 +0000
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Martin Jansa
	<martin.jansa@gmail.com>
CC: Ming Liu <liu.ming50@gmail.com>, Stefan Agner <stefan.agner@toradex.com>,
	Ming Liu <ming.liu@toradex.com>
Subject: Re: [meta-virtualization][PATCH] docker-moby: update to v19.03.12
Thread-Topic: [meta-virtualization][PATCH] docker-moby: update to v19.03.12
Thread-Index: 
 AQHWS95xidjMyyP4aUKi0F6sAdcQuqjrK6tkgAABzoCAAFEo74AAJBUAgANE9YCAAHKGgA==
Date: Mon, 29 Jun 2020 08:37:55 +0000
Message-ID: <619B9396-3C30-422E-ADF6-06A05B7EB2F9@arm.com>
References: <20200626161705.32600-1-liu.ming50@gmail.com>
 <CA+chaQei6WPUNkN0OOkk+MxEsWmnPSkTBAnrUq9KLbXmx87y1g@mail.gmail.com>
 <161C28A10F0C0173.4849@lists.yoctoproject.org>
 <CADkTA4NCh2F1=-aX7zwOaZvEC1as-r7=s=+C3HoWNr7MwyGh=A@mail.gmail.com>
 <CA+chaQemwGtgKjGqbdnaeEVG7st0QoM3o1JwppiVFY=2Hx6D4A@mail.gmail.com>
 <161C29D35303F5F1.8018@lists.yoctoproject.org>
 <CADkTA4OGYEC2=wuMfY4adbn2V4oyH02oac_=TqCURZUuY=pkTA@mail.gmail.com>
 <CA+chaQejB_++EQN4SX_R1PfXGOb=HSpQy9EtOPQe4SxVDXDSUA@mail.gmail.com>
 <CADkTA4OfHD+tV1d920bkY0pp=+ArRVDUmBhAejySHOmmb7Zs9A@mail.gmail.com>
In-Reply-To: 
 <CADkTA4OfHD+tV1d920bkY0pp=+ArRVDUmBhAejySHOmmb7Zs9A@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.38.20061401
x-originating-ip: [81.2.106.35]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e9b3220e-ac33-45cf-9bdc-08d81c07bd9b
x-ms-traffictypediagnostic: VI1PR08MB4574:|DB8PR08MB5513:
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB551346D3A404F9DB1E125080E86E0@DB8PR08MB5513.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:10000;
x-forefront-prvs: 044968D9E1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 /X5lE6ze8G+mk9s4sBdN2dWcch/GqDDK5YkJTtAr3DR5pv65C0HGppxJliKF/BqeagZc379yw1p5jWM0LR7tJeG0L9mLd1ghzoLJm9QR+8+3PpNdkR+hree9BI7KdnzgC/hHYmSHL2JGTKA7mriDP24DgSZIv2lBf0vHelBVfIxzoJfQOoQ2nRZbXXrjpHnbwhUR2fhRwMhWMmja+WcmELgZNh0p2aznt2OxCYIyTRRCvx8OFBS/K7JunIixvAuIbIg2wvXSJQt0J3eQMtSW546NgJsLWa/l5cKNQc7fZjiWG7vkSn3Ow2CVKp8vQltWnS0uQpdl5FENOsiyVzEAbQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0801MB1678.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(366004)(136003)(376002)(396003)(39860400002)(66556008)(15650500001)(36756003)(64756008)(66446008)(4326008)(26005)(6506007)(2616005)(8936002)(53546011)(478600001)(8676002)(6512007)(186003)(83380400001)(33656002)(86362001)(110136005)(66476007)(6486002)(71200400001)(316002)(2906002)(54906003)(66946007)(5660300002)(4744005)(76116006)(91956017);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 6Z/LXEtFd1fRIjJWLDLNgXEKG9PWDoPlWx4KZSCmqUXTnI3R9MA8ldIyZxWQZjTuZSPsPfii74p+XWXH9v9j8pLyyB4YsAMAyp9lRhaRNwngm1gKPs7xpfxqvPE1E2IBaj4n96Urw7v09x5q1xTMlQHdb17QULxbCvyxO+ltCqNhtxd5mQBSHd49fjZMWwBZKRMhC5+OrFEFW0ntAzOciEUmSvhpAXXNbwBIfhBkEXlNS0uBDtk0ZOoIZVBALbueahHCV0QxyiGy09CHTj3AjZrn9MZ/XwIL+gJPlMkeRckDZygHLCX+qhC7aOkOwVY7BF9WOg82WJICwJs29c0ZjyKwYJ2L10e0KOeI+Fo97QyQknIP/1JiMmWG9qzZr5Y8lFgOUBoYQRGkEsqQ6GkwZXgnl3q5xPAyoBGGHwe3kVQ+TMU4414RN8yjQZ0W3R9evxSZ+zt4Pz7UaIP2UZY/OyERjktX9nbq9dOIGZ1XbFs=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4574
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Ross.Burton@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(376002)(346002)(136003)(39860400002)(46966005)(8936002)(86362001)(8676002)(26005)(15650500001)(83380400001)(186003)(2616005)(82310400002)(356005)(81166007)(2906002)(6486002)(53546011)(47076004)(33656002)(6506007)(82740400003)(336012)(5660300002)(4744005)(6512007)(70586007)(478600001)(36756003)(70206006)(107886003)(36906005)(316002)(450100002)(4326008)(110136005)(54906003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	31414a89-81b5-41ad-dc92-08d81c07b858
X-Forefront-PRVS: 044968D9E1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mgf25BO/lbakiV0UYfg6/JPolIo0N5FIi3r7hdsc22KrSRzxPw2O/gC1IGFyBXI+y9ddpqozN5zXbv55CPUObQr9jTjch8GbFdYkY1ExIak7WEGs1Y7zsKAj1QYdr+ceBUD0+kZ86UwS1UTnTwBJLOQ+UM+IhI3Mxlek1Vif2sYIanyekZaS0NSbBJBJ54GhJULLYhP2oJxC0tPZVclf/WEZhZqDKXGytlSXpRRsn1ip61u/P1c5bP+dd7eT8LdDYFtR++K8M6A8ICK4RuAZAbC0tRJ+1Xf6dn3AkWHeSnHNuMKCA0kQwJy4Y780qcCUuI6kDFon/G/bO43aEGJ9GWo1nUJpdX+748ejMasq8bnWA7VQnloLmHDTYERy8BXh5CB5/CwXQS7iCfgUOvz2oA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2020 08:38:04.3277
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9b3220e-ac33-45cf-9bdc-08d81c07bd9b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5513
X-TUID: W4gOKIYLXzRl
Content-Language: en-GB
Content-Type: text/plain; charset="utf-8"
Content-ID: <DB62DD303C71B64CB59FA2E4080CEF89@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gMjkvMDYvMjAyMCwgMDM6NDgsICJCcnVjZSBBc2hmaWVsZCIgPGJydWNlLmFzaGZpZWxkQGdt
YWlsLmNvbT4gd3JvdGU6DQo+ICAgICBJbmRlZWQgdGhhdCB3YXMgdGhlIHRoaW5nIEkgd2FzIG1p
c3NpbmcuDQo+DQo+ICAgICBJJ3ZlIHJlcHJvZHVjZWQgdGhlIGVycm9yLCBhbmQgaXQgaXMgd2hl
cmUgSSB0aG91Z2h0IGl0IHdhcy4gSSdsbCBwb2tlDQo+ICAgICBhd2F5IGF0IGEgZml4IHdoaWxl
IEkgbGlzdGVuIHRvIEVMQyBkdXJpbmcgdGhlIGRheSBvbiBNb25kYXkuDQoNClRoYW5rcyBCcnVj
ZS4gIERpZCBJIGJyZWFrIGFueXRoaW5nLCBvciBkaWQgSSBqdXN0IGV4cG9zZSBoaXN0b3JpY2Fs
IGJyZWFrYWdlPw0KDQpDaGVlcnMsDQpSb3NzDQoNCklNUE9SVEFOVCBOT1RJQ0U6IFRoZSBjb250
ZW50cyBvZiB0aGlzIGVtYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgYXJlIGNvbmZpZGVudGlhbCBh
bmQgbWF5IGFsc28gYmUgcHJpdmlsZWdlZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJl
Y2lwaWVudCwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5IGFuZCBkbyBub3Qg
ZGlzY2xvc2UgdGhlIGNvbnRlbnRzIHRvIGFueSBvdGhlciBwZXJzb24sIHVzZSBpdCBmb3IgYW55
IHB1cnBvc2UsIG9yIHN0b3JlIG9yIGNvcHkgdGhlIGluZm9ybWF0aW9uIGluIGFueSBtZWRpdW0u
IFRoYW5rIHlvdS4NCg==
