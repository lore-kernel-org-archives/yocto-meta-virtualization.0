Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.6489.1600911626790520899
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 23 Sep 2020 18:40:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=TATm5NF3;
 spf=softfail (domain: windriver.com, ip: 198.145.29.25, mailfrom: mingli.yu@windriver.com)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2086.outbound.protection.outlook.com [40.107.243.86])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 995E038C155B
	for <meta-virtualization@yoctoproject.org>; Wed, 23 Sep 2020 18:40:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fiBV6c6uVr9g+6cgEUesXh0op6RJ5FXUNAJ2/ei5tgJedl0tJHwHL5quy3eDHpG2i3ZQ5R4EMScuF1wXK/8yd7qSxenCQdAw0Wqu6rL0OV+WaSP5lTNr4sngSpHgpygiovKYYZ/0DbZtNizQ6xnpTiQ3+0mvHXLxNrcSEqNCKqlSMv9Y/PaZh5e2wOs6+7k39GboLSADTrmrMSryB+yw5UeCcxKJCCkj0/gccI9em/2rBOxCjEbJebevMTK5b3ppCP2hCJ3GksvLDVISHi8ptsEWo68uIPX+7ZPELlp6cIgJRPUhTtOOdR1psTEMDEdl/OgBlPgD4cYuLgK4go2FMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZNRXz02cResJCasdcOzFB4rNf8ekm4nrnu9xUkpSZjk=;
 b=Nv0cZuKKX67ZqvmMHxmsWvFz7wd3UoI73JGv7cLzCJ8/M4fL5lTJUp/fwx8Wv0dZLDUDCnQ/dr87hBqnBnlOvd9PnPeg7XnEVnvo7oOake0seR5UG1muJ2J3pmPbyp2CP1auyXNoIJ6zCHMsA1G/Zpkw7QOVJAp4mhmU03hoGnst3QDIG4SjYPUcet+tSXSjVW9Nh4XTKS9cV83bDeOUVUWH6/QIsZ1pyJ9J4Gb8T4+QG4u/lrIJ5SrVQLFkapy+yIGFDeqvlQj+i9SCD+ghWOL8s3Cs9gDg4bEcdRFfHpW1KLg2xS/1M+gEqPTdlC56TwWNFO/2wYQrz0zFzvwXfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZNRXz02cResJCasdcOzFB4rNf8ekm4nrnu9xUkpSZjk=;
 b=TATm5NF3mt3oEZXl9tk5uIZyzszAOVQ8nhrgVJkjy19ucq6L9wYtQvQwd8xd3jKfiVtk9ZiTbIkbVkmSBLxSExr48BkI2C2VuD1MeNPJyfmjaE01llqXQHQOoIjE0KJumtbEF2phxtAKal6fNoze1jTw0YdZB3t4qS+CDKCUfMA=
Authentication-Results: yoctoproject.org; dkim=none (message not signed)
 header.d=none;yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17)
 by BY5PR11MB4307.namprd11.prod.outlook.com (2603:10b6:a03:1bd::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.26; Thu, 24 Sep
 2020 01:40:23 +0000
Received: from BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::dc3d:f132:1438:7e10]) by BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::dc3d:f132:1438:7e10%7]) with mapi id 15.20.3391.026; Thu, 24 Sep 2020
 01:40:23 +0000
Subject: Re: [meta-virtualization] [PATCH v2] lxc: remove deprecated options in lxc*.service
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
References: <16370E1C8879D0E3.12779@lists.yoctoproject.org>
 <20200923075309.46978-1-mingli.yu@windriver.com>
 <CADkTA4NfOEhuR1JWWkJPAZvNKU6kk_Prz9kejRwBYefqxsFo_g@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <e3483726-1d87-f7f6-0ff2-515e94ba4ff1@windriver.com>
Date: Thu, 24 Sep 2020 09:39:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CADkTA4NfOEhuR1JWWkJPAZvNKU6kk_Prz9kejRwBYefqxsFo_g@mail.gmail.com>
X-ClientProxiedBy: BY5PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::37) To BYAPR11MB2598.namprd11.prod.outlook.com
 (2603:10b6:a02:cb::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.138] (60.247.85.82) by BY5PR03CA0027.namprd03.prod.outlook.com (2603:10b6:a03:1e0::37) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22 via Frontend Transport; Thu, 24 Sep 2020 01:40:21 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c33d332f-876b-4348-353a-08d8602acd93
X-MS-TrafficTypeDiagnostic: BY5PR11MB4307:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4307385A437DF7BC7BC0D7ABF1390@BY5PR11MB4307.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:506;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	v7wOO++wYGCaT6A7DglwYC79b3oaxtEFJO0EnwxL+FWTqAavaxVSXhCIw/c1NhfklRohf/WQXNU4JRdZCbkcgzGLntYq5r4b1SqcKJOxUSs1WRenvjDmdm0HycEPP8XMsYo+GB/aWZE7rhr839KGvUUV/PVlfcbWRzZ+CXrLObCVsmBwNzd4mqIAci/9UhYn1IdVxRi16bN1AfpkqLY8eYhUPe+m7q2U4O1bqjXq394zPMSAfcKLYdqx/PNRUFgrnchBO46q/U9L5rHdxtR+wOpAyrp2bVuXTbZlA2TMJVOkZOt/RVJfxY9UI6Hz1XQ7Qe954Og762vYg2cy40iuYbfE7X5Gpj4/sKtoIs5x7D2Lta2sDo9JwXslo6DXFOGmNX9GHOSVUfA73VsDVn34n/TBQW21eiFuoANHMFTlOcPSby9sm7seOBTHObQvomK0t/o1Z6lckKOx49RsViqtLFbSUsl/rcaK6ndRksts+jM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(366004)(39850400004)(396003)(26005)(6916009)(53546011)(8676002)(31696002)(6706004)(86362001)(2906002)(6666004)(66946007)(6486002)(36756003)(52116002)(16576012)(83380400001)(966005)(4326008)(478600001)(5660300002)(66476007)(66556008)(16526019)(956004)(31686004)(186003)(316002)(8936002)(2616005)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	WHhXtRDrMe7Tane/EXjllCxrAhhksDKA5iq93frbJE9MxrYADy2lcPX5NQLh75KnDC5O8qM28KZDPPqw87YSvujUbV+Btkcw6kOLw/DWDfTF9cz787jcXPvVGp7losGcxhgRd2prukYl7fIeVI/c3a8OR72Ld2CmJzpDwGMvOo3AKQCYhs07DMRn9fTPpCokd2c5Wpm4eXO3Q/D/Arkf/rO8p/X0gRcIqgkN7NqDhZpWNJ8xVF4CBpzFfT4c/IrWhOcG6Nx9jVrmILzPfiqVkWmyX8j/UaMqqsXzHq0bN4G988IZc6tBSrqVFgJIPkT9Uyi+PgHoI04NERBHfVIIm6AVE6gytixcpUCKPLe1usqXPX+VT2RVQ1303hJlRtjNQ0wFHRDRKdeuDWzGWNtRcqdCwrkjgA54y1lc3RSo+ukyY6bmhE6Z9EifAU8wTu+/Z3pUsH+xjPgWyp/l1aCOuha9shBJNddXVFsAO0L8ce+gn1YbuANdvNHnfDpLdvhnDVPSHAbwQQRP0+pucabfAtwlxFeHfwvB61pQvo7C6b/iG3nsCwksFK0+6/UF7Tn4wl8TE20HKWVEEdeMXELEoT+eywdBNjB/Nw3OfgEdawDjAwkLzqicpfVTD/4ZH3vQmUEDUiF8HzAByWaRrpUBHA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c33d332f-876b-4348-353a-08d8602acd93
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 01:40:22.9823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: spsoCSeLiO+GC7h3BDlMAPa6C0dChMTwkUuGaRITKw7h6yy/rUGauAZuETE7r8ZBGOdsuZsM+rT7iSk0TYOZJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4307
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Bruce,

On 9/23/20 8:40 PM, Bruce Ashfield wrote:
> On Wed, Sep 23, 2020 at 3:54 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
>>
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> Remove deprecated options in lxc*.service to silence below warning:
>>   # systemctl status lxc
>>   [snip]
>>   /usr/lib/systemd/system/lxc.service:17: Standard output type syslog is obsolete, automatically updating to journal. Please update your unit file, and consider removing the setting altogether.
>>   /usr/lib/systemd/system/lxc.service:18: Standard output type syslog is obsolete, automatically updating to journal. Please update your unit file, and consider removing the setting altogether.
> 
> What's the delta to v1 ?

The v1 only have one patch
   file://0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch


And the v2 have the below two patch files.
  file://0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch
  file://0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch

Thanks,

> 
> Bruce
> 
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   ...setting-regarding-the-Standard-Outpu.patch | 35 +++++++++++++++++++
>>   ...ed-options-in-lxc.service-fixes-3527.patch | 31 ++++++++++++++++
>>   recipes-containers/lxc/lxc_4.0.2.bb           |  2 ++
>>   3 files changed, 68 insertions(+)
>>   create mode 100644 recipes-containers/lxc/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch
>>   create mode 100644 recipes-containers/lxc/files/0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch
>>
>> diff --git a/recipes-containers/lxc/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch b/recipes-containers/lxc/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch
>> new file mode 100644
>> index 0000000..ab97422
>> --- /dev/null
>> +++ b/recipes-containers/lxc/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch
>> @@ -0,0 +1,35 @@
>> +From a7a92a06a47322dee45664db5c7bfa68b2b95edb Mon Sep 17 00:00:00 2001
>> +From: Mingli Yu <mingli.yu@windriver.com>
>> +Date: Wed, 23 Sep 2020 07:03:02 +0000
>> +Subject: [PATCH] Remove obsolete setting regarding the Standard Output
>> +
>> +The Standard output type "syslog" is obsolete, causing a warning since systemd
>> +version 246 [1].
>> +
>> +Please consider using "journal" or "journal+console"
>> +
>> +[1] https://github.com/systemd/systemd/blob/master/NEWS#L202
>> +
>> +Upstream-Status: Submitted [https://github.com/lxc/lxc/pull/3541]
>> +
>> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> +---
>> + config/init/systemd/lxc@.service.in         | 2 --
>> + 1 files changed, 2 deletions(-)
>> +
>> +diff --git a/config/init/systemd/lxc@.service.in b/config/init/systemd/lxc@.service.in
>> +index a2aa2211f..21ce64aef 100644
>> +--- a/config/init/systemd/lxc@.service.in
>> ++++ b/config/init/systemd/lxc@.service.in
>> +@@ -14,8 +14,6 @@ ExecStop=@BINDIR@/lxc-stop -n %i
>> + # Environment=BOOTUP=serial
>> + # Environment=CONSOLETYPE=serial
>> + Delegate=yes
>> +-StandardOutput=syslog
>> +-StandardError=syslog
>> +
>> + [Install]
>> + WantedBy=multi-user.target
>> +--
>> +2.26.2
>> +
>> diff --git a/recipes-containers/lxc/files/0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch b/recipes-containers/lxc/files/0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch
>> new file mode 100644
>> index 0000000..2957680
>> --- /dev/null
>> +++ b/recipes-containers/lxc/files/0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch
>> @@ -0,0 +1,31 @@
>> +From 0c4cd88d4a19d27ba9b5d2c8fa4d482d78211c35 Mon Sep 17 00:00:00 2001
>> +From: graysky <graysky@archlinux.us>
>> +Date: Fri, 21 Aug 2020 06:33:49 -0400
>> +Subject: [PATCH] remove deprecated options in lxc.service fixes #3527
>> +
>> +Remove deprecated options in lxc.service fixes #3527
>> +
>> +Upstream-Status: Backport
>> +
>> +Signed-off-by: graysky <graysky@archlinux.us>
>> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> +---
>> + config/init/systemd/lxc.service.in | 2 --
>> + 1 file changed, 2 deletions(-)
>> +
>> +diff --git a/config/init/systemd/lxc.service.in b/config/init/systemd/lxc.service.in
>> +index e3745dc2d..397a6c4d0 100644
>> +--- a/config/init/systemd/lxc.service.in
>> ++++ b/config/init/systemd/lxc.service.in
>> +@@ -14,8 +14,6 @@ ExecReload=@LIBEXECDIR@/lxc/lxc-apparmor-load
>> + # Environment=BOOTUP=serial
>> + # Environment=CONSOLETYPE=serial
>> + Delegate=yes
>> +-StandardOutput=syslog
>> +-StandardError=syslog
>> +
>> + [Install]
>> + WantedBy=multi-user.target
>> +--
>> +2.26.2
>> +
>> diff --git a/recipes-containers/lxc/lxc_4.0.2.bb b/recipes-containers/lxc/lxc_4.0.2.bb
>> index d0ead81..ead6bb2 100644
>> --- a/recipes-containers/lxc/lxc_4.0.2.bb
>> +++ b/recipes-containers/lxc/lxc_4.0.2.bb
>> @@ -47,6 +47,8 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
>>          file://templates-use-curl-instead-of-wget.patch \
>>          file://tests-our-init-is-not-busybox.patch \
>>          file://tests-add-no-validate-when-using-download-template.patch \
>> +       file://0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch \
>> +       file://0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch \
>>          file://dnsmasq.conf \
>>          file://lxc-net \
>>          "
>> --
>> 2.26.2
>>
>>
>> 
>>
> 
> 
