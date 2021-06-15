Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.4359.1623725315761534085
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 14 Jun 2021 19:48:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=I3m1wPw8;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1800207bcf=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15F2mYNo030966;
	Mon, 14 Jun 2021 19:48:34 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com with ESMTP id 3969p50chn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Jun 2021 19:48:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ddz1Pr+idM4PCY6AGhlPupSUvW2e3jWhH+udZE+W8wSoEp6aHino/zrE1Qxk8iKh//l+06LY7x3pLmdCDDeHGn1pkKJ+qVlx6ejC5pmbTwQiNK7UBHZYKAJ2pfW002hyBWhCSvCv+7HwUFkHCJJxe6ji8bCJlrvjKtHLn6LMKiX1O8ie3rroiSt/78dBTY9d8Pg1HoEcwgQ/WXD9rJRUxGWR7pUn4bYsHvjp2N4cyhAqELoC9rVIA4BhbbgcHJo9gsG/ehOEBAW6RzHiokwtJYKz8X//vKBD0///wTcJHseCkpB+PZbGzV28b/jgFNFoT83S5THbfn9awVmD2ii+Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+4XXlmC006dQFFbQSRCRpCEf1O+ykf0rOZHCOOFa8tI=;
 b=ELU0/kHaHgE79xrC2AyCsjfcMor9/Paf1AElqni1skdkyiiJE9EUKt8o8ZdXF0pEGsN1UK6m00vcDFUIsw9akxV5XiQrgCxe3Gd1P1XUnADS8fC6OaIS0rrVtbgTlg/G23UQTlinpf53o+xOCVpK1+1uNUyySrJ2kz3+v6jYdktetal1Xd18kYxjy2yEx7ov3z8awHXpSWjKkXzxyrJn1ZtcTfm1qlDIARo+Tguz6cqP+9I5zBuh7wC249Bjm4N2lO2KckrBIG7I+L5J495oGmBR+qxsXxKvGOiDFGEN1slXVOWAPFPhsnP5m/juymYY8eQRNO+ZlaE+cRvhLLeDVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+4XXlmC006dQFFbQSRCRpCEf1O+ykf0rOZHCOOFa8tI=;
 b=I3m1wPw8LummXamg4q69O8CwVtYEj4OsfajO3oDAZe+T90AK9X/6R7jWTb9vd1utv2cTixaJB/LI3l/82xIopHK3VzdOTpHS47sPDav8G86kbOwxJlW0xAHhfBQiMWxr04JAP4qgeheAo/f3YuenN5N+2DJRsSlqapyG1wn4Cbk=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB1432.namprd11.prod.outlook.com (2603:10b6:910:5::22)
 by CY4PR1101MB2262.namprd11.prod.outlook.com (2603:10b6:910:18::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Tue, 15 Jun
 2021 02:48:30 +0000
Received: from CY4PR11MB1432.namprd11.prod.outlook.com
 ([fe80::3da3:9e4a:b2a7:cfda]) by CY4PR11MB1432.namprd11.prod.outlook.com
 ([fe80::3da3:9e4a:b2a7:cfda%5]) with mapi id 15.20.4219.025; Tue, 15 Jun 2021
 02:48:30 +0000
Subject: Re: [meta-virtualization][PATCH] runc-docker: adjust patch to fit latest version
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Chen Qi <Qi.Chen@windriver.com>,
        meta-virtualization@lists.yoctoproject.org
References: <20210317054105.28887-1-Qi.Chen@windriver.com>
 <CADkTA4PrV4snkCyQ3A9KpJhaQsr-85j3Mt4QqCuO+52fd3MLtA@mail.gmail.com>
 <f6186111-db43-2c48-f0f7-ee71b0a0b5db@windriver.com>
 <CADkTA4OfN1jdwKNio6sKMzVVZ7HN7Xtc3Fy34hTi0ufnfeWawA@mail.gmail.com>
From: "kai" <kai.kang@windriver.com>
Message-ID: <15ce5879-f30c-d7c8-5db2-0246f048889a@windriver.com>
Date: Tue, 15 Jun 2021 10:48:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <CADkTA4OfN1jdwKNio6sKMzVVZ7HN7Xtc3Fy34hTi0ufnfeWawA@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0008.apcprd03.prod.outlook.com
 (2603:1096:203:c8::13) To CY4PR11MB1432.namprd11.prod.outlook.com
 (2603:10b6:910:5::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.151] (60.247.85.82) by HKAPR03CA0008.apcprd03.prod.outlook.com (2603:1096:203:c8::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.9 via Frontend Transport; Tue, 15 Jun 2021 02:48:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe2ae316-6ea7-4849-833a-08d92fa80f29
X-MS-TrafficTypeDiagnostic: CY4PR1101MB2262:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CY4PR1101MB2262191548CC4D877BD8FA8E95309@CY4PR1101MB2262.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	clhBAApDuTEk57qJNL3sqbkE3XELmAhd8lp2ZF9oNwQvE2FQ4lLpn7GCQO+sNBZbASkATMQc2IcfMmgcIghlj8yIJLzTwxJQaNNREsVJGgpv2/eXYxIzvgaKbVmrznmv7Cvxyud/Eh3qR5OO2v71vTwKXtxPabXIWu7yonP7fpSkdK2qCLVBdG8k6MgG4BxHSoohwuxynZlHobKaIRNdYUivhUo7jLOLScaEBZnkZJnOR7TMZXsFrDQsyCd++KSJCE1Q77eAcGqn+e4ePCBg4k3jApecEDcRrVuE68lksF8sV1WKeknsl+uzq+EmU+PPkaY5vrRZ/eMsEzx7w0U+uy8Q66rBWn4wmnr6pYMZpKww6uAFiJhqhcj4waCGvJex54Pm8SRYsx2mmeHyCS8FTX3DfLwrIeARUkkKbmnFS4de+JV//4AVO9r6O1I/tMWjC0zATTNBFPhwwR+OlB+F6lW2LYvDmHB5cb47cRaOhwujYPBP0zQIowVZQUgagBoLeX01T/e8RuHbTkACW6Wh2bCjKoNCV1XUZwJKJIKUrurAe+o6JcR64qzQR14AxJSNhQOLLr6PiawbohXbZwJCpnx+8Vn7dXYWcrhCd4gpCKKHiWgUt6Et6hzBsvyFsvfStrchJOeaVFHY04HwfgeVYwEMRihWdei8YRQ3aUN9QhtNidsj2ixguzqZOVuBOL5vfyuI/zNQYPzGfTAiUQ3bH57E2DXj0i2ItlkIeScOnWQAH3t/yigBhpXcaGAjyXDWxFW6s4AP1oaDUpFsEydgU7IBbHu+q8g6W0Fk459tv0OGcKY0ClYWeRUmm5saBIzjX3qDkYEVH4m7JQe/b1jIGr7+AVaLNU/gJho6qKQ9lt2pp1dKEU2z/qlR7kiZxOGantfg3mM9Ap8nSxFa6/qH6Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB1432.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39850400004)(136003)(346002)(376002)(966005)(2616005)(316002)(83380400001)(31686004)(478600001)(6486002)(52116002)(4326008)(26005)(16576012)(186003)(36756003)(16526019)(956004)(8936002)(8676002)(38100700002)(6666004)(38350700002)(31696002)(66946007)(6916009)(5660300002)(53546011)(2906002)(66476007)(66556008)(6706004)(86362001)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OUhHa29SaTNaZkd3WlVSK1hKaDdFdDRITksvN1puOC9UclNuZHBGK3VNMExI?=
 =?utf-8?B?WFF4REZhRkRrS2YxbzJkUm5mSEVtcStWNmlCd3FmTitraEc3c2tmWjJzWlUx?=
 =?utf-8?B?MmVUdjlia3JsMmxYZTNlL1M2REVZR0FRVG5Sb0MzZW04cmttZ2h4MHRlRWo3?=
 =?utf-8?B?M05tWGI4MFR0ZzRNRFljWFJMUmtsRHZiOVE1bVYrU0JFTGppamd1dFYxWHpz?=
 =?utf-8?B?aWdVVy94ZVhXMm1HeU9qcTdlV2JTU0dQcXZIRk91MStwUGJ4ZWg1aUQ4dURY?=
 =?utf-8?B?cE11QmVuOW9SUGxQMURkR2F0Nm1IZXBjMG81aHR5WDFvZW1JQ1dCaXF3REZh?=
 =?utf-8?B?amNQeUE4a0RvTVpBTWpsYzJFMTBURTloZVBzNGFRZFhkZ21CRE5xQVRoMThu?=
 =?utf-8?B?LzB4b21wa1JtSnNtNXNLS2pBMUpVLzU5TmRRK01OTXpUcmJMSkJFeEpQcmtT?=
 =?utf-8?B?a1lYbVlQbHEvMTFKcGdhb0ZxNkhaQTVpanhodWd3bEZFdWVETG9tbktGTUpk?=
 =?utf-8?B?b1dXYkdJMEJKamh2WGlWVGxoRUFuRmt6U2NuNXNLMFRkWlZVNHk2dkVrUFNa?=
 =?utf-8?B?Z3czN3Awdmxvd0FzdUZPRkE3eFF2SllQOG5jdGFTS0cwdTVlcVN1UnByNDN0?=
 =?utf-8?B?czczQXNiREh1Z0o2YTFCRk85TTJRdUpwRWtoWVFhdHRJN3oxTHZHUzFrOEp6?=
 =?utf-8?B?M2tKUE5kSGdCaDRTRDYzVk9FeFI0ZG10eUw4QWVYQlJCSTlpTExhRTU5d05S?=
 =?utf-8?B?djJIVDR4bkNXVlh3VGJ1eHFoaVNrOGpjUThyRjJmVXE3UWRWLzZyaEJtTy81?=
 =?utf-8?B?R0hGMWF1TnlaeXVhUTdDK0xHSTJlNjhCa1d2bTRWa0dUcU0xSEUyaVBmSDhH?=
 =?utf-8?B?Vk9rQjQ4andYbEw3TFBmbDhuVjExWmEzYVVsZTZhSEcyRTlLbkdYTVh2K1Vi?=
 =?utf-8?B?L2l6S3hhS3JiY1NhTFo1MnM2ZmNjV2k5YUYxbW1oWkU1Si9ScDNIYjBMMlc3?=
 =?utf-8?B?cWEyVW9pTUEzNnJ6ZUFZa0JBa2JraUtJZmRXU3FvUXV3V3dkODVIUXVkd2My?=
 =?utf-8?B?YXdEQktLLzlNQ2dLRXRPR2d6VlVnM2VydkdZUEVkQ0hqWCtSU0Evd09PcldI?=
 =?utf-8?B?ekZQUnB4dHJiSXd2c2l5T01LM3dMclVGbVp2aFlTMXNoSnIzRVhXWmFlUTJw?=
 =?utf-8?B?cDA4dEFjMGZjQUk0clRnMDRsNlozc1lqUnpSQnFYUUZ1NFhpSmp0bzBkb1hi?=
 =?utf-8?B?dkQxTG42cmJzM0ovU0NnMVRYbS8wdkxBSUNDajNUR2RNR2t0STlMM2d2WnNu?=
 =?utf-8?B?c29VMjNzZTMwdzJjUjhkbWtJSnlhZXY2eDVUNDIxaTM2OStmMkkvdGNBVWI3?=
 =?utf-8?B?YXNkcURVMmlmSlVVM3dYdW04cUFTVXMyQzF5Y2JiVXB6RDV6U3BIelpTbkFo?=
 =?utf-8?B?WXlCMXVDcE12VUNnKzI5YlNsRDFiQ2p0aWRmeHVoZjRib0FkNFJac1JlamND?=
 =?utf-8?B?VTVoK1dQeFMvUGtDanpwTms1WTEvN1V4aVNkNUhQYk5ENTErYjMwMm9peGZC?=
 =?utf-8?B?ckF0QVUzNzl3QjBmZldWZUh0bzM5cGx1QWtQRkNqTHd0Qy84eS9NWlNabzRh?=
 =?utf-8?B?bEx5dndtWnBsZjZldXFlM3RvOFYyNGM3RXlTcWtTUEdRV0xFanBrYy9lODFv?=
 =?utf-8?B?UzRRV0haaUxDQnNRaUhHc0Z1eVRUYngzT211dEFWVEZTZFN4WkgxMHVVT3M5?=
 =?utf-8?Q?0QblLW6vcJgJjjaJ3VbCFgpfv6MTRW/rMET7L4K?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe2ae316-6ea7-4849-833a-08d92fa80f29
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB1432.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 02:48:30.6545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9GnR5esg/MgIRyO4ZxtYYvWSNrhqIVN5GNF5uSm0MsVMVf+UTl8TdUzBJ7FcLyit90M8B//0lXewvjTpKWU0fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2262
X-Proofpoint-GUID: vApzpqYSKSevlSUNgJpBKfHai86zg1Rm
X-Proofpoint-ORIG-GUID: vApzpqYSKSevlSUNgJpBKfHai86zg1Rm
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-14_14:2021-06-14,2021-06-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106150016
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 6/15/21 10:43 AM, Bruce Ashfield wrote:
> On Mon, Jun 14, 2021 at 9:51 PM Kai <kai.kang@windriver.com> wrote:
>> On 3/17/21 8:59 PM, Bruce Ashfield wrote:
>>
>> On Wed, Mar 17, 2021 at 1:41 AM Chen Qi <Qi.Chen@windriver.com> wrote:
>>
>> Adjust patch to fit the latest version.
>>
>> This is the wrong fix (and the commit log is wrong).
>>
>> I unified runc-docker and runc-opencontainers upstream repositories a
>> while ago, since there are no longer docker specifics in a runc
>> variant.
>>
>> I will delete the runc-docker recipe soon, but have been waiting on
>> that a bit longer.
>>
>> When I bumped runc last week, I forgot to bump the second variant as
>> well. I've now done that, and the patch issues are gone.
>>
>> Hi Bruce,
>>
>> It breaks do_patch again. And what is the "second variant" you've mentioned, please?
>>
> I just pushed the fix.

It works.


>
> By "second variant", I just mean the runc-docker.
>
> At one point, it was significant, but it is basically identical to the
> runc-opencontainers one at this point, with a couple of extra patches.
> There's one shared patch, and I tend to forget to update the
> runc-docker when I bump runc-opencontainers.

Got it. Thanks a lot.

Regards,
Kai

>
> I'll start the process of dropping runc-docker in the upcoming release.
>
> Bruce
>
>> Regards,
>> Kai
>>
>> Bruce
>>
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
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>>
>> 
>>
>>
>> --
>> Kai Kang
>> Wind River Linux
>
>

-- 
Kai Kang
Wind River Linux

