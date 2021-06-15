Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.3878.1623721885284647432
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 14 Jun 2021 18:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ebsmzuKH;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1800207bcf=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15F1hw6u022038;
	Mon, 14 Jun 2021 18:51:23 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com with ESMTP id 3969p50bht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Jun 2021 18:51:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HKt1pwEjkipUkWxcJ+PvG4/kPR5f4qtI0D8UmyeSOU7HCncRS1MuKSan+8ZYwWcMCJ2aEeMI82CMnj52CYv8UnhiUHc1+JUa9NFfvxO21ZX3mhN19t4VlbKcoXEOf1FhpwBa2U5qxxkm4LqQubQLPClwK8McA2pE1csCSeQrRb+jAqsJwwA+mi2TQgZzaS57cSKS3mQ504mQEvPQrWeEJyOIcRpE88Diy/bJdoFCY2MCR3/FuqiHUIAnOqPHDLmI7IvBYGDpAf+EljZ1TwkZy6wrF8UH3wA3nNM3s5KOm8wNZtx12QZoApedxp11PUje7aZ84M50qnK3piPlgLmTVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHyolQVhIHSz/sKkI5V5Xz6YFncpEb9CNblRZMBSeXg=;
 b=eqc5rqz/treDfd9/cghzQ4HyrpHCH7l5XXcpSjGuSJEMj9kAVw3B9fbNKW1h7LeFqi+Y48LRK7WsX8IBRNi/vyOdxCRguRnzXZbiqTvQmJQlkBV4pFkEg4Zpsgsjia3FVXHTIxjcuLjsChsMg8RkjnIOCOxV4Q/p7jg1ddo2BtfE+2SPwg95YEwSopA82LTi3Xj61+NYArRha4O64+Hazjk5gkdxfQMpJ/35krqtDO74/wc+fexCc/w3wZaoEWjxP82EzEKLxkrrlI/EXZdT5VryH5FWVx59WhqiRjSS2QNyaE/mO4uNYYd80umxM6neDhVQl9ijIEVniiMOc2sk0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHyolQVhIHSz/sKkI5V5Xz6YFncpEb9CNblRZMBSeXg=;
 b=ebsmzuKHEtUx3yCcwiwSVuA7NEkr/+gVknQBSLMmjirQD+M+8cIyf+9q1fVHCXrxo8J97Co4u/rPAItoS87pMnjJdB5x8u7p3nHAn8f+KlzS/FcOOCdxHT+w2xEjPeI5etL2gbtC9ryyw7c7HhVX6up0vI1U80OwY60FXzZZ18I=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB1432.namprd11.prod.outlook.com (2603:10b6:910:5::22)
 by CY4PR11MB1576.namprd11.prod.outlook.com (2603:10b6:910:d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Tue, 15 Jun
 2021 01:51:18 +0000
Received: from CY4PR11MB1432.namprd11.prod.outlook.com
 ([fe80::3da3:9e4a:b2a7:cfda]) by CY4PR11MB1432.namprd11.prod.outlook.com
 ([fe80::3da3:9e4a:b2a7:cfda%5]) with mapi id 15.20.4219.025; Tue, 15 Jun 2021
 01:51:18 +0000
Subject: Re: [meta-virtualization][PATCH] runc-docker: adjust patch to fit latest version
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20210317054105.28887-1-Qi.Chen@windriver.com>
 <CADkTA4PrV4snkCyQ3A9KpJhaQsr-85j3Mt4QqCuO+52fd3MLtA@mail.gmail.com>
From: "kai" <kai.kang@windriver.com>
Message-ID: <f6186111-db43-2c48-f0f7-ee71b0a0b5db@windriver.com>
Date: Tue, 15 Jun 2021 09:51:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <CADkTA4PrV4snkCyQ3A9KpJhaQsr-85j3Mt4QqCuO+52fd3MLtA@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR03CA0101.apcprd03.prod.outlook.com
 (2603:1096:203:b0::17) To CY4PR11MB1432.namprd11.prod.outlook.com
 (2603:10b6:910:5::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.151] (60.247.85.82) by HK0PR03CA0101.apcprd03.prod.outlook.com (2603:1096:203:b0::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15 via Frontend Transport; Tue, 15 Jun 2021 01:51:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b40ba85d-ad5a-4205-a01b-08d92fa0114e
X-MS-TrafficTypeDiagnostic: CY4PR11MB1576:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB15763023092B3916B4994EC195309@CY4PR11MB1576.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UtHoewBHJfu+bVbjwSCbGnGEniZ/ZXhpJ1tIF5PlCJE7kn0iMKidolXpxEI1r2Fjj2jvjDtgZw+uYSrdL8MZKJZfFQBOYOXrciwDD075x8iAzS11mbrs3BfeE8Yfh3cMMD6pDRzN5JMGY8durSjpZEStLMFuuu7Vp19ROXz/JMZxU45TNuXLDKlLA1KDAzMQqW3tkOUfe4wYXHJfIzLy0auoBMJnOK0vo8WJp7CMVOHuNvjd0T1ENH4ehqIb5XcT0yqb6EaO7vuoc1devXqEQMxTy+/bi/gdrqqSgRhsJEu9KnbeAUKbNxq1Uxqa9P1L8WAT/PQcz+7MRwpAm1nZOV2KCgSLa9Xxo3O/nmO3uyksoYBxcv8ttGJ7dXQT2A8KbFMeX0oJyt0erQ/4UYq6ZJMnzz92MsGVDgo4KX/HA2AXF9IjW/qqKG5RbXtePsd1NCYLBcUnXECKtGMgiU6EfDt2JB6rgSIhnk+dbKiRsSIhuj7mtHaLZ1YYct35Y9WfRiBx3s6CHWrFeGbfka4VnKy2XfO3gLQv5g6yn4MJkSXG4TE9znTBmnfcHIv/iiQKzoYijiUrSCWj9Z2ZcvProb4hx8qARGSiqAEtm2RzMsh2cs+X8dnPNm4Ig0iLDNPGM1rubHrT/uJFwORydlS+tjKwpTOUUKtOQ7W4BLezoTzn6/d/qjTAYOh6nRxcGVrw3gsHHXM2zF0li4FRRPe34Qvr27kjhkcUZTXokUH+dBpDpEF4+nuoch4YLuiMMoaw9yfG7kj/wN4iRQEELq76nN2k86nhhtTcBZWqVlLXGV/Zb3SwdxBnTPqEh+uNPKqn8p7mUREX9W52ca64lpadJqlamF2Elb+x5A+qdxCv4lvRazXx3vSHw6QPeZ9eeOdO06DWs75LqPGrI3r1mXquVw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB1432.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39850400004)(366004)(376002)(346002)(166002)(6486002)(83380400001)(66476007)(31696002)(36756003)(38100700002)(38350700002)(66556008)(66946007)(4326008)(6666004)(2616005)(966005)(956004)(478600001)(2906002)(53546011)(31686004)(86362001)(33964004)(5660300002)(6636002)(316002)(8676002)(6706004)(52116002)(26005)(186003)(8936002)(110136005)(16576012)(16526019)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SmlXdUd3TENJMEJPNHBOaHVWbjBUMU5xUmhnRk1QWWxhekx4Q2Rsck5ONWlE?=
 =?utf-8?B?WHd0Z3c4UGtIc2I0Mnc3Yk1TL2ZRdUJwUldZWU9IbCs5TnE3L0J5MlhvUjlC?=
 =?utf-8?B?bkhIU2RJNTk4M1BrMGdkaEVUQXBHYU5TZzRaQ1pUMlZBRFU5WVo1bHJWeWJS?=
 =?utf-8?B?VVAxVUszbzFGSmlvOU1ua25aVnVPc2NkektUSlNURjdCVVdacHJLUXBoS3F5?=
 =?utf-8?B?Sy9TVnNjeXZNZFJhWEpvWlJTVnJRbTZkSVlwU0pLSmV2LzQ1Vi9TT3F1N0Nm?=
 =?utf-8?B?aDNqcjV2ekYrWHlzdDl5UXRNNndIVndHYkovZHJpVnluSUhZVGxRcStGYk5Y?=
 =?utf-8?B?MmRkK3JYb2trZFhzb01vbmYvUld5M0ovQThYcWxyczdqVkNub3ZKb0h0SFBT?=
 =?utf-8?B?b1NuV3l5TW9WYm5OWWtNMzlxUGFFNjdaNXNWYmhZNm1pUzdrOTFwaFJNK0Jp?=
 =?utf-8?B?V2hqOW1WL0hxRFJDQ09ZbFVtMjBhTllCV0FWcGVUMXpiay83cUVJbWxmUUJR?=
 =?utf-8?B?MlhPb0Z5MHAxbFRpZEpuRHFxbm9vd2VlMTlEY2h5dk0xd2ROM251YVNwTGVY?=
 =?utf-8?B?NkJWTmE2OFBVTEZxb3JpcXA5NXdWZ1VnY0pUNURtNXFrZHNpZm9qbXhMamYr?=
 =?utf-8?B?WWFiSWRqamxVdGtxU0RkcVRlbnYzdElvb2lwZm8wTnEyaWZ5cU54MkJUK1A3?=
 =?utf-8?B?eWE0WkIwamtLVCsxbXlzQUJkd05hU3BuRms3RmZXOFRnTG5MenBRTUV0aGxa?=
 =?utf-8?B?MzVZcGs4OUNkODBRUWNKbWwxb0Q2NXhUUHQ2MGwwUmJQTXNYTUE0SVNHQ0Jz?=
 =?utf-8?B?Nlg2ek5wS3ZVb3p0Ykl1dGtrNVRnMHQ4YldZS284UFM4Sk5HaGhXbGNzUkxo?=
 =?utf-8?B?aEc1SlloZ2VnZ0NLVDZGbFdZR2xGSmFVZVIwY3ovTVljOHVJZldWNUtvek51?=
 =?utf-8?B?WVIvSjMzNElRODdTRjdjTE5NRkhhTG5tbFAyNUxwc2hCMzBrQ3dwYk8xVlp5?=
 =?utf-8?B?SHFCV1RPbC9aOUJlSzljVnNtZVFpQk0ycDh3d2ZjZW4zRklFWUtjK05QSWRx?=
 =?utf-8?B?c1g3QmxWSTNEcFZKNjhkTzZtbUVQQU5TeFVpQWZWQzE2SlA3UkpvNnZncnhz?=
 =?utf-8?B?SFF0SDlPYzFaQ0lUNDBHbU5mTGZHTXBvbFB3aEhGZWhuL0NjZDdRUVk2SVVI?=
 =?utf-8?B?cnZnaUkwVEdLT1QvMmlMcHpxVCtmMU5xY1VTSk10N01LS1RIYm9XcEtBSGlv?=
 =?utf-8?B?b1JwbU5NUmdvdHhENTQ2UVN6VHIyaUx6OG1jTnc3TVpFRHBnR2dvMmNVRysy?=
 =?utf-8?B?bG5yVTZZMmE4eXJicWpwdEdtK21QeXZWOWxsaVd1Y3hyMGp2dmtPQU1vWFRu?=
 =?utf-8?B?SzVPcVY0c05Bb2xUTGVOMjhTbWpIZmFRVXV0MkFZQlpNZTVvd0ZnMndGcTJ1?=
 =?utf-8?B?SXVrVEcrcENaTFRZZ1dxeC81Yk1XdEtWczlVZEdXUUxQNS9ZQjN6Lzh2Zlcr?=
 =?utf-8?B?T05jSDFrcjVLbkpTUEpUZjAwbStZbGVvbldHOXNmRGY0KzRWNnpUZ1FsVnhN?=
 =?utf-8?B?NHc0MDZyYnZETG9OaFc0bkJjM2t3TDgzR3czK1FldEVCUWhIMlM5elJabHJ4?=
 =?utf-8?B?N21yamhlbHNFZG1hcjByMkZNcVBML253QzVnbzNLVU1PWVNkbG9LeGdDOTRQ?=
 =?utf-8?B?SmVKWHpsaTBCc2tYTXpMalNXcGd0eGpVYzF4bi9KSXE5T2I5Z2ZOKzN1YVhv?=
 =?utf-8?Q?zLyVyIwOtz4QpvUOc8lWdFUEkbygWN5JaEeX5SS?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b40ba85d-ad5a-4205-a01b-08d92fa0114e
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB1432.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 01:51:18.5912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ekYr1OEulZGyDhkG+zPl+F8kkwDqEWqzL8/rpqXon560D9u1twyEeEAUOgUE9+Oihxb0Be//2bFJFavIsWll8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1576
X-Proofpoint-GUID: LVKLLIl6vDiIuwTR-HTBNOMa_1mQCHHG
X-Proofpoint-ORIG-GUID: LVKLLIl6vDiIuwTR-HTBNOMa_1mQCHHG
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-14_14:2021-06-14,2021-06-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 phishscore=0 clxscore=1011 adultscore=0 suspectscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106150009
Content-Type: multipart/alternative;
 boundary="------------D727F1C79B313307B16E85FF"
Content-Language: en-US

--------------D727F1C79B313307B16E85FF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/17/21 8:59 PM, Bruce Ashfield wrote:
> On Wed, Mar 17, 2021 at 1:41 AM Chen Qi <Qi.Chen@windriver.com> wrote:
>> Adjust patch to fit the latest version.
>>
> This is the wrong fix (and the commit log is wrong).
>
> I unified runc-docker and runc-opencontainers upstream repositories a
> while ago, since there are no longer docker specifics in a runc
> variant.
>
> I will delete the runc-docker recipe soon, but have been waiting on
> that a bit longer.
>
> When I bumped runc last week, I forgot to bump the second variant as
> well. I've now done that, and the patch issues are gone.

Hi Bruce,

It breaks do_patch again. And what is the "second variant" you've 
mentioned, please?

Regards,
Kai

>
> Bruce
>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   ...docker-Makefile-respect-GOBUILDFLAGS.patch | 37 +++++++++++++++++++
>>   recipes-containers/runc/runc-docker_git.bb    |  2 +-
>>   2 files changed, 38 insertions(+), 1 deletion(-)
>>   create mode 100644 recipes-containers/runc/runc-docker/0001-runc-docker-Makefile-respect-GOBUILDFLAGS.patch
>>
>> diff --git a/recipes-containers/runc/runc-docker/0001-runc-docker-Makefile-respect-GOBUILDFLAGS.patch b/recipes-containers/runc/runc-docker/0001-runc-docker-Makefile-respect-GOBUILDFLAGS.patch
>> new file mode 100644
>> index 00000000..7ea9109a
>> --- /dev/null
>> +++ b/recipes-containers/runc/runc-docker/0001-runc-docker-Makefile-respect-GOBUILDFLAGS.patch
>> @@ -0,0 +1,37 @@
>> +From c8ac2963cf17d4ee45b8b6ccbdfd81fe52e7092a Mon Sep 17 00:00:00 2001
>> +From: Chen Qi <Qi.Chen@windriver.com>
>> +Date: Tue, 16 Mar 2021 22:27:45 -0700
>> +Subject: [PATCH] Makefile: respect GOBUILDFLAGS for runc and remove recvtty
>> + from static
>> +
>> +Upstream-Status: Inappropriate [OE Specific]
>> +
>> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> +---
>> + Makefile | 3 +--
>> + 1 file changed, 1 insertion(+), 2 deletions(-)
>> +
>> +diff --git a/src/import/Makefile b/src/import/Makefile
>> +index e13d8f1d..409b61dd 100644
>> +--- a/src/import/Makefile
>> ++++ b/src/import/Makefile
>> +@@ -23,7 +23,7 @@ ifeq ($(shell $(GO) env GOOS),linux)
>> +               GO_BUILDMODE := "-buildmode=pie"
>> +       endif
>> + endif
>> +-GO_BUILD := $(GO) build -trimpath $(MOD_VENDOR) $(GO_BUILDMODE) $(EXTRA_FLAGS) -tags "$(BUILDTAGS)" \
>> ++GO_BUILD := $(GO) build $(GOBUILDFLAGS) -trimpath $(MOD_VENDOR) $(GO_BUILDMODE) $(EXTRA_FLAGS) -tags "$(BUILDTAGS)" \
>> +       -ldflags "-X main.gitCommit=$(COMMIT) -X main.version=$(VERSION) $(EXTRA_LDFLAGS)"
>> + GO_BUILD_STATIC := CGO_ENABLED=1 $(GO) build -trimpath $(MOD_VENDOR) $(EXTRA_FLAGS) -tags "$(BUILDTAGS) netgo osusergo" \
>> +       -ldflags "-w -extldflags -static -X main.gitCommit=$(COMMIT) -X main.version=$(VERSION) $(EXTRA_LDFLAGS)"
>> +@@ -40,7 +40,6 @@ recvtty:
>> +
>> + static:
>> +       $(GO_BUILD_STATIC) -o runc .
>> +-      $(GO_BUILD_STATIC) -o contrib/cmd/recvtty/recvtty ./contrib/cmd/recvtty
>> +
>> + release:
>> +       script/release.sh -r release/$(VERSION) -v $(VERSION)
>> +--
>> +2.30.2
>> +
>> diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-containers/runc/runc-docker_git.bb
>> index 118bfc1d..9e7043ad 100644
>> --- a/recipes-containers/runc/runc-docker_git.bb
>> +++ b/recipes-containers/runc/runc-docker_git.bb
>> @@ -5,7 +5,7 @@ include runc.inc
>>   SRCREV_runc-docker = "b4cb54c2ea78b90f9d8284316aeaeff876f61dfc"
>>   SRC_URI = "git://github.com/opencontainers/runc;nobranch=1;name=runc-docker \
>>              file://0001-runc-Add-console-socket-dev-null.patch \
>> -           file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
>> +           file://0001-runc-docker-Makefile-respect-GOBUILDFLAGS.patch \
>>              file://0001-runc-docker-SIGUSR1-daemonize.patch \
>>             "
>>
>> --
>> 2.17.1
>>
>>
>>
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> 
>

-- 
Kai Kang
Wind River Linux


--------------D727F1C79B313307B16E85FF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 3/17/21 8:59 PM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CADkTA4PrV4snkCyQ3A9KpJhaQsr-85j3Mt4QqCuO+52fd3MLtA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Wed, Mar 17, 2021 at 1:41 AM Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Adjust patch to fit the latest version.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This is the wrong fix (and the commit log is wrong).

I unified runc-docker and runc-opencontainers upstream repositories a
while ago, since there are no longer docker specifics in a runc
variant.

I will delete the runc-docker recipe soon, but have been waiting on
that a bit longer.

When I bumped runc last week, I forgot to bump the second variant as
well. I've now done that, and the patch issues are gone.</pre>
    </blockquote>
    <p>Hi Bruce,</p>
    <p>It breaks do_patch again. And what is the &quot;second variant&quot; you've
      mentioned, please? <br>
    </p>
    <p>Regards,<br>
      Kai<br>
    </p>
    <blockquote type="cite" cite="mid:CADkTA4PrV4snkCyQ3A9KpJhaQsr-85j3Mt4QqCuO+52fd3MLtA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

Bruce

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
---
 ...docker-Makefile-respect-GOBUILDFLAGS.patch | 37 +++++++++++++++++++
 recipes-containers/runc/runc-docker_git.bb    |  2 +-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 recipes-containers/runc/runc-docker/0001-runc-docker-Makefile-respect-GOBUILDFLAGS.patch

diff --git a/recipes-containers/runc/runc-docker/0001-runc-docker-Makefile-respect-GOBUILDFLAGS.patch b/recipes-containers/runc/runc-docker/0001-runc-docker-Makefile-respect-GOBUILDFLAGS.patch
new file mode 100644
index 00000000..7ea9109a
--- /dev/null
+++ b/recipes-containers/runc/runc-docker/0001-runc-docker-Makefile-respect-GOBUILDFLAGS.patch
@@ -0,0 +1,37 @@
+From c8ac2963cf17d4ee45b8b6ccbdfd81fe52e7092a Mon Sep 17 00:00:00 2001
+From: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
+Date: Tue, 16 Mar 2021 22:27:45 -0700
+Subject: [PATCH] Makefile: respect GOBUILDFLAGS for runc and remove recvtty
+ from static
+
+Upstream-Status: Inappropriate [OE Specific]
+
+Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
+---
+ Makefile | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/import/Makefile b/src/import/Makefile
+index e13d8f1d..409b61dd 100644
+--- a/src/import/Makefile
++++ b/src/import/Makefile
+@@ -23,7 +23,7 @@ ifeq ($(shell $(GO) env GOOS),linux)
+               GO_BUILDMODE := &quot;-buildmode=pie&quot;
+       endif
+ endif
+-GO_BUILD := $(GO) build -trimpath $(MOD_VENDOR) $(GO_BUILDMODE) $(EXTRA_FLAGS) -tags &quot;$(BUILDTAGS)&quot; \
++GO_BUILD := $(GO) build $(GOBUILDFLAGS) -trimpath $(MOD_VENDOR) $(GO_BUILDMODE) $(EXTRA_FLAGS) -tags &quot;$(BUILDTAGS)&quot; \
+       -ldflags &quot;-X main.gitCommit=$(COMMIT) -X main.version=$(VERSION) $(EXTRA_LDFLAGS)&quot;
+ GO_BUILD_STATIC := CGO_ENABLED=1 $(GO) build -trimpath $(MOD_VENDOR) $(EXTRA_FLAGS) -tags &quot;$(BUILDTAGS) netgo osusergo&quot; \
+       -ldflags &quot;-w -extldflags -static -X main.gitCommit=$(COMMIT) -X main.version=$(VERSION) $(EXTRA_LDFLAGS)<a class="moz-txt-link-rfc2396E" href="mailto:+@@-40,7+40,6@@recvtty:++static:+$(GO_BUILD_STATIC)-orunc.+-$(GO_BUILD_STATIC)-ocontrib/cmd/recvtty/recvtty./contrib/cmd/recvtty++release:+script/release.sh-rrelease/$(VERSION)-v$(VERSION)+--+2.30.2+diff--gita/recipes-containers/runc/runc-docker_git.bbb/recipes-containers/runc/runc-docker_git.bbindex118bfc1d..9e7043ad100644---a/recipes-containers/runc/runc-docker_git.bb+++b/recipes-containers/runc/runc-docker_git.bb@@-5,7+5,7@@includerunc.incSRCREV_runc-docker=">&quot;
+@@ -40,7 +40,6 @@ recvtty:
+
+ static:
+       $(GO_BUILD_STATIC) -o runc .
+-      $(GO_BUILD_STATIC) -o contrib/cmd/recvtty/recvtty ./contrib/cmd/recvtty
+
+ release:
+       script/release.sh -r release/$(VERSION) -v $(VERSION)
+--
+2.30.2
+
diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-containers/runc/runc-docker_git.bb
index 118bfc1d..9e7043ad 100644
--- a/recipes-containers/runc/runc-docker_git.bb
+++ b/recipes-containers/runc/runc-docker_git.bb
@@ -5,7 +5,7 @@ include runc.inc
 SRCREV_runc-docker = &quot;</a>b4cb54c2ea78b90f9d8284316aeaeff876f61dfc&quot;
 SRC_URI = &quot;git://github.com/opencontainers/runc;nobranch=1;name=runc-docker \
            <a class="moz-txt-link-freetext" href="file://0001-runc-Add-console-socket-dev-null.patch">file://0001-runc-Add-console-socket-dev-null.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch">file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://0001-runc-docker-Makefile-respect-GOBUILDFLAGS.patch">file://0001-runc-docker-Makefile-respect-GOBUILDFLAGS.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0001-runc-docker-SIGUSR1-daemonize.patch">file://0001-runc-docker-SIGUSR1-daemonize.patch</a> \
           &quot;

--
2.17.1




</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">

--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Kai Kang
Wind River Linux</pre>
  </body>
</html>

--------------D727F1C79B313307B16E85FF--
