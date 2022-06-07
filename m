Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A101C433EF
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 13:50:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.12570.1654609803337021108
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Jun 2022 06:50:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=YswdDej5;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=315732fafe=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 257C0GUb023279;
	Tue, 7 Jun 2022 13:50:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=umJ/D9hckaWI5sktJjcu7qz5iFYFLEQS5e1jJj9cVnw=;
 b=YswdDej52qYTXpwvzdGCCK38QpRQV4A0GXSt0PNh03VL+xrnZUmxLio03ywWpMwwR9ds
 ofW0+w2XvYpzT5yrLDag98Ugb8cXdHqZ8XXyegTWDjpi/R9UpxYGaWBrGn3LhvRiiqby
 uKQL6gFx3oRFzZeyk0LVYWtDD8KOzy6LSaKD85XebmH8zqGjYZtY1jOeTZ8yQxseo3b8
 noXbQW3A56heY8rT0IqoOlr0cKx7H86nAUiNhPTzaagNlbkTRKxbJysGLwbrr9EExTir
 +/QHMTqB34i5x3MKPDesWEMnhOuJ0UG20HWWaFlnBM4ZnKhr5GAhBm42aBIdIHLYDYK4 Sg==
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gfvm2278v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jun 2022 13:50:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i1k1Sf2LcrPaiBEqAh/r7SUCLJkFWvwmH0HdnizEufw/0vydxxXAlUxPuGTJiKrz8LQMNqY9fEGkWjvECq/VPLvpwZPcCZg2gG8a0JdGutrcXBhhfWslTNwKyF5Bt/pCT1z5ZM4DvezLv+jxX9bc693fIt5HMLp/ma34+pAmrmXdphR9/COFiv1x46JGlm4H1m3D6bOhxO6TVJ9lrfKxLAGLJ9k4yl+DVj3jbesrDESvV8ccu35x8H03sBULGtDe0LEdCUhUtRh7WLrJTvCE8m52CETSQShlr7qLEU7IIpr7ZCRsbVLa/K15WF3hkWV7+9BZ/q8V638mzm1SQc3HVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=umJ/D9hckaWI5sktJjcu7qz5iFYFLEQS5e1jJj9cVnw=;
 b=UqVUZZGf+J5xftos63gjIOWnbxyT+R9bN4wlrRiO6RPVx6yAUfSoNL7toPyD2fuDipruSIyHPetEA6Wq0Hnzs7y2ffgqwrT8K8b/5t+V2C7V1z0t4cZPhSrfkCIHRqvN/kE/4hXmH9lGrabVDWt25ZVZitupZdp9dpWmai9tULhfZAD6KsgA7qfKGAhNB/pTKyizHYcIrlvPilXqDjEQTapyuK7X73ld3ICVfqhBUd+tLa3CuvZEQFzyTaOMaaZVTuJXi6EsRH7ChoYhOFdHkHEg3nDlzQej+vjccTI4/MU6pqwgy9tI12jEh2sZ4O+ASf1I0CpPDRLrRD+obCzXvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 BL0PR11MB3298.namprd11.prod.outlook.com (2603:10b6:208:66::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.13; Tue, 7 Jun 2022 13:49:58 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::a807:4bee:8e08:3053]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::a807:4bee:8e08:3053%7]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 13:49:58 +0000
Message-ID: <e25f93e4-3512-eb34-aa57-c691f8e169d7@windriver.com>
Date: Tue, 7 Jun 2022 09:49:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [meta-virtualization][PATCH V2] buildah: add recipe for buildah
 v1.26
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20220525234347.3799-1-sakib.sajal@windriver.com>
 <CADkTA4PJT5HwekzjTQsCg3dt=N25fwzAaRpXGQkH7a=SUDaMkA@mail.gmail.com>
From: Sakib Sajal <sakib.sajal@windriver.com>
In-Reply-To: 
 <CADkTA4PJT5HwekzjTQsCg3dt=N25fwzAaRpXGQkH7a=SUDaMkA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0306.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6d::28) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a7e7176-a237-4cd6-cb21-08da488c9c0e
X-MS-TrafficTypeDiagnostic: BL0PR11MB3298:EE_
X-Microsoft-Antispam-PRVS: 
	<BL0PR11MB3298565D8488ADAB41FD5B5EF2A59@BL0PR11MB3298.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jgEJ5z9D3cLG1goMeRqE2T7kwTnC0uKj/DhbWMHT6J6Y2fmssAAgJmrTWohVtMbhLOLFwChmrbP+idRue+5f5lQ4uKrKKEtAD+ey8V7tPQBLgeepvjc3FQzuf39VC5wRznTZdQ9V1N3vaixycEKlIJ9FAkYOdeJBMquoY+kdOMMmULLr4U3KDPyB4bigUDGi+/XPv4lng2gFGkiztNm0b4fBmwOLTzKcdOnFKYr4n1PwqCkQA6fWtylvkefYRVzb8MG0B41zrDweISNCnxbt6TQ954jgkSdm/YXcH/mPwaW6Nd/I7njakNRLS/dfPN2hunVx57tCx/dJjsQYFdIpSmweyEt25G2fYym9WjVC3yomVnd4XEAwhPTMz+aYtbEccpRZe7Xxp3UIWwb4Njvl5HD55ven0cnmVAutg/H3x1uyIXDfNG+WpujZF4CHNRCJ90PGA6o0tKZLUjq0nPymz/uoxOokffx5rdcyyqx07UYxsblNZctK5Iqyq3dD3SwytXlJ6S4c5PkNxa/akkNeGLmwrgcfjKyT5UMg8Gp9hMx+DnWOrNCv910so3SqHz2H+MUVKqq1rdhX8FyEmC+V9FELERVVfZdt4OZGyhe44rV9VTFoLF/CMjBSYSjeO+/6VKsAwFuYTRk7hSrxjpiK13dNJ5ho3zZhzi25rv7tXZ8WOu9zDgszOrjKPEtbfJtTR84UAvnFtWpkQBbd/LqZzvtuWwZrhmXtjP4lSd9rD4sdl7NV7SzgmxW/d7JmOzYbbY7cVpGQTzJaDmVVk7h/VhIWR+VZWN2EqyTr/0YA4aU6l5KmOBozdcX4KQacPqDTTcE205O/YM11h6+eWzUiSnbymDz1vd0oMU9m4HxRGDo7l1SJDWWJPoPNbQk+YLne
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(6916009)(6666004)(66476007)(66556008)(36756003)(66946007)(2616005)(26005)(31696002)(6512007)(86362001)(5660300002)(8676002)(52116002)(31686004)(4326008)(53546011)(186003)(8936002)(44832011)(6506007)(316002)(508600001)(83380400001)(6486002)(2906002)(966005)(38350700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cUpObTM2WFdyRW53ZGh0bmNCWDdxU21YNjVpUmVvZWplRFJaVUpwTnVXSll5?=
 =?utf-8?B?bXRqN09OejNyd01CT0lyN1hGTEJpUE92NzhQQzk4N1lLVmtZLysyTnBxY0Y1?=
 =?utf-8?B?bGF3TUR0VDFsUCsyNkdhQmh0U3QrUzh5RC9iWWhlTlhUc0ZqbGloMkxHMEFj?=
 =?utf-8?B?SDZyc2pWTzdIMzY1a2RGQ3VaYnM1WUVBMFFPcy90UnE4ek5IcGx6dERnMjFl?=
 =?utf-8?B?L0VONjZLWFEwZzIyUnhtakdZMG9HN3A4TTlWNU9DTE5YcmJsWnh6Wmh3VUNO?=
 =?utf-8?B?RWpLMjJVamlUTXpXYThzUU1SZ0lWejRnSHFaQzlocWZRd1dtN05mblp2WnUw?=
 =?utf-8?B?SmxCRW1pa2tNOWlDNllCR2hmL1pPV0J1aFVpNFJPbzU3RFoxa3VHSzV2aGE4?=
 =?utf-8?B?M2pSQTMvRWZrM2JrMDNWMDZvOHp6RU1NRkVVckhGdG1EbGRUWE4yUzkwNUJY?=
 =?utf-8?B?TDdHM3VRWWRDVUZRdk44N0M2QkRlUWx4cEJpNjFER2FJUCtOUmRsa0t4Q0Ux?=
 =?utf-8?B?VkcwQjl6YTFNT0doYllHS1NqYkJKVjE3R1pNNWh2ZElpdCs1UnVmWnQ2bzNu?=
 =?utf-8?B?cTQ1TENiTm05QzJiSHQ5UzVxaE9TR1VJcDU2aGdBcS9ZdHR3bmI2QjJmTVp1?=
 =?utf-8?B?ZTZadmF3dHBJeWRmVEJRQlYxMzVYbkZmNDgwVmUxeEJqRjZtTUdnY1ZnK0hX?=
 =?utf-8?B?anJsMTZtb1BsL1EyTk12RjZhb2E1Q3pabExIamVYQWlJS0RuMWdnT2RRVTBq?=
 =?utf-8?B?bUNNRzNMVzkrYS9EMWsreEs5NklmU3ltZTBiZXBmb2MyN3pvRjZ0YTExVG5m?=
 =?utf-8?B?VUtzUDBUVDVMamtJZ3FjRHVVdVQ1cXl2TUZqeU9RelE2dnhORklZMXg5VGIx?=
 =?utf-8?B?OGR0L2RXSmZQdWIxNnNSckQvSkpCZ0RDQnpSaDU4S0VFcEI0Uk5sS2dhWnhY?=
 =?utf-8?B?RUpZVnppWkRZb3Jub1dlbUs5K0MrWW1PRzVySmYvSDZDT0lzVzdJMlRCbmJh?=
 =?utf-8?B?eTdzSjRTRFl4bFJHZmZoVmVXNlFlRWlYOXUxOFJmSkZUQkJZL1BGcnhjOXdl?=
 =?utf-8?B?Z21mTVFJeGduL0Z6MUNQTThLeVVzdnc4OFU5ZFRvSTYza3lQbTdyeWQxZFVw?=
 =?utf-8?B?NTNTNTYzK3ZSN0hNNE00VmJINTRZSWthK3RUT3AxckZ3QXR0bWVlNlgwUENx?=
 =?utf-8?B?QjF4N3hzOVlSN0paMzFCV2IzdnVPcll6TjVINGdyWjFLTXVQakh2a0JCTFVa?=
 =?utf-8?B?SHoxKzlqNnVKNWU3Q2d3akdwZ0R5dFV5YVh2bjlSaUdXTXM3dU9US21wZzFv?=
 =?utf-8?B?T2kwdlRrY1dxNWVvWFN3blVYdTVRVlNGa01TaFNCampGakhkZGQxV3JNN1lB?=
 =?utf-8?B?ZE9UTXpaUmcxdUNLbFdlbWludHR1YXRTSHdkaFZseVYxM25ncitJU29PMEZP?=
 =?utf-8?B?ZGlhaFlXa1ZjSDlhMCtSakVuSlc0SFg5RGFEL3hxeWJrL3UwWW5ibnBTV2xY?=
 =?utf-8?B?M1VNUWd0UXkwcWl5L0Y3WkdNZldFU2srejFKRk9RTXdxQTBNVGRNSVg2SFVZ?=
 =?utf-8?B?dUc0N2NWU0hkYXRickt4cFhKcEJMdVBSL3p0UXpmaVVQelNHbnBwZHBwczZn?=
 =?utf-8?B?S2JjSFhlODRwbVB4TzBqd0FZQW1XRE95WENQS095d1ljTjdKUTEzbkxPYXVQ?=
 =?utf-8?B?VTEwMXowU0FhbVFYYzZ1OUF4eWUxMGVkNTRUNjM2blhJSEQyUGxjSXdGOStE?=
 =?utf-8?B?L1ZnY0NFdzNuclYyaVdFc2IrdFVFR2M0b2d3YXRiQzU1LytiUzlTdnoyNk5Z?=
 =?utf-8?B?V1BaRjREbDBCdHVFTkkwYXN4UHVzeE9TNXVoak95QlJ6RjhkUlZWZUJWc3pR?=
 =?utf-8?B?bk50a0VYcGFOR2hRclliWllseVp3MFUrRWFOa3J6Y3l1KytWUlNCeDg5RHhR?=
 =?utf-8?B?a0sxS05SSUpFTEhlODQvVG9oREdFazlHL2g1MUtqTzh2Z1lLV3NXdzVQZTRM?=
 =?utf-8?B?MGRYem9rQlNiZnNOdmlQZUtERlhzZEd5eEVIcGdDVm5PZGpMZDViUWlELzBH?=
 =?utf-8?B?Q3lwWG1GNzVHclBYcTd5VDZaNURGbHVSVElUOEN5enBjY00zTmp4NkpzNVhF?=
 =?utf-8?B?WWt1c0JmYk55bHM0YWM3NGpHbUVqYURnbmVvOWV0Sk56TWlyK2RYQ1puY0U4?=
 =?utf-8?B?T056ZWVoQnFOUEpzc2lDSUF4ODYyanA0YnhCejlOUFArdElBSzQyNkxUbVNU?=
 =?utf-8?B?Z21lenFTUUtDUHQ1VVczZ3ZnNXBnc0JsUDBMWmpySlg3cUQ3UnhRM1RnYzQ4?=
 =?utf-8?B?YjN2ME5QWEhqdGpDWU5aVndOQlUyQ282bi9VaEVQT3JJZk55WWlWcVRUNFNo?=
 =?utf-8?Q?17X2Da0HeM3sG1BM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6a7e7176-a237-4cd6-cb21-08da488c9c0e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 13:49:57.9526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 qU2htoVQi0vzFCWLyBML0jja/e/sl/RQOQomSbYiHpTvP+Ca/5v394hx1o4RcRqLFQus4aT9bD6vfoo3+D+oeHgOv7pwZHL7PMmjD1xQqnM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3298
X-Proofpoint-ORIG-GUID: KOfb-LFvJKW31gFMn859NGXbim4r6KO2
X-Proofpoint-GUID: KOfb-LFvJKW31gFMn859NGXbim4r6KO2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-07_06,2022-06-07_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 clxscore=1011 bulkscore=0 malwarescore=0 spamscore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206070057
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Jun 2022 13:50:11 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7337


On 2022-06-07 08:59, Bruce Ashfield wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On Wed, May 25, 2022 at 7:43 PM <sakib.sajal@windriver.com> wrote:
>> buildah is a command line tool, to be installed and run on target,
>> that can be used to:
>>     - create a working container, either from scratch or using an image
>>       as a starting point
>>     - create an image, either from a working container or via the
>>       instructions in a Dockerfile
>>     - images can be built in either the OCI image format or the
>>       traditional upstream docker image format
>>     - mount a working container's root filesystem for manipulation
>>     - unmount a working container's root filesystem
>>     - use the updated contents of a container's root filesystem as a
>>       filesystem layer to create a new image
>>     - delete a working container or an image
>>     - rename a local container
>>
>> Testing:
>> Setup the build directory:
>>     $ . oe-init-build-env <build_dir>
>>
>> Add to local.conf:
>>     IMAGE_INSTALL:append = " buildah kernel-modules"
>>     KERNEL_FEATURES += "features/overlayfs/overlayfs.cfgi \
>>                         features/netfilter/netfilter.scc  \
>>                         features/lxc/lxc-enable.scc"
>>     IMAGE_ROOTFS_EXTRA_SPACE = "5242880"
>>
>> Build image:
>>     $ bitbake core-image-minimal
>>
>> Run the image:
>>     $ runqemu nographic kvm qemuparams="-m 4096"
>>
>> On target:
>> Pull an image:
>>     > cnt=$(buildah from fedora)
>>
>> Or build from Dockerfile
>>     > buildah bud -t <image_name>:<tag> .
>>
>> Mount the image:
>>     > mnt=$(buildah mount ${cnt})
>>
>> Install packages on the container rootfs:
>>     > dnf install --installroot $mnt <packages_to_install> -y
>>
>> Copy local files to the container:
>>     > buildah copy $cnt <local_file> <dest_on_container>
>>
>> Save the changes to an image
>>     > buildah commit --format docker $cnt <name>:<tag>
>>
>> Run the image using buildah:
>>     > buildah run $cnt /bin/sh
>>
>> Or using docker:
>>     > docker run -it <name>:<tag>
> I haven't forgotten about this, just with the storms and power outages
> here in Ottawa, I'm running way behind in my patch processing.
>
> Bruce

Thank you for the update, I was about to ping you regarding this.

Sakib

>
>> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>> ---
>>   recipes-containers/buildah/buildah_git.bb | 57 +++++++++++++++++++++++
>>   1 file changed, 57 insertions(+)
>>   create mode 100644 recipes-containers/buildah/buildah_git.bb
>>
>> diff --git a/recipes-containers/buildah/buildah_git.bb b/recipes-containers/buildah/buildah_git.bb
>> new file mode 100644
>> index 0000000..024e82c
>> --- /dev/null
>> +++ b/recipes-containers/buildah/buildah_git.bb
>> @@ -0,0 +1,57 @@
>> +HOMEPAGE = "https://buildah.io"
>> +SUMMARY = "A tool that facilitates building OCI container images."
>> +DESCRIPTION = "A tool that facilitates building OCI container images."
>> +
>> +# Apache-2.0 for containerd
>> +LICENSE = "Apache-2.0"
>> +LIC_FILES_CHKSUM = "file://src/github.com/containers/buildah/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +BUILDAH_VERSION = "1.26"
>> +SRCREV_buildah = "0a9d6e6eaef2e2e7936313d449a4e226022eb865"
>> +
>> +PV = "${BUILDAH_VERSION}"
>> +
>> +inherit go
>> +inherit goarch
>> +inherit pkgconfig
>> +
>> +GO_IMPORT = "github.com/containers/buildah"
>> +GO_INSTALL = "${GO_IMPORT}"
>> +GO_WORKDIR = "${GO_INSTALL}"
>> +GOBUILDFLAGS += "-mod vendor"
>> +
>> +SRC_URI = " \
>> +    git://github.com/containers/buildah;branch=release-${BUILDAH_VERSION};name=buildah;protocol=https \
>> +    "
>> +
>> +DEPENDS = "libdevmapper btrfs-tools gpgme"
>> +RDEPENDS:${PN} = "cgroup-lite fuse-overlayfs libdevmapper podman"
>> +RDEPENDS:${PN}-dev = "bash perl"
>> +
>> +do_compile:prepend() {
>> +    cd ${S}/src/github.com/containers/buildah
>> +}
>> +
>> +go_do_compile() {
>> +        export TMPDIR="${GOTMPDIR}"
>> +        if [ -n "${GO_INSTALL}" ]; then
>> +                if [ -n "${GO_LINKSHARED}" ]; then
>> +                        ${GO} install ${GOBUILDFLAGS} ./cmd/buildah
>> +                        ${GO} install ${GOBUILDFLAGS} ./tests/imgtype/imgtype.go
>> +                        ${GO} install ${GOBUILDFLAGS} ./tests/copy/copy.go
>> +                        rm -rf ${B}/bin
>> +                fi
>> +                ${GO} install ${GO_LINKSHARED} ${GOBUILDFLAGS} ./cmd/buildah
>> +                ${GO} install ${GO_LINKSHARED} ${GOBUILDFLAGS} ./tests/imgtype/imgtype.go
>> +                ${GO} install ${GO_LINKSHARED} ${GOBUILDFLAGS} ./tests/copy/copy.go
>> +        fi
>> +}
>> +
>> +do_install:append() {
>> +    dest_dir=${D}/${sysconfdir}/containers
>> +    mkdir -p ${dest_dir}
>> +    install -m 666 ${S}/src/github.com/containers/buildah/docs/samples/registries.conf ${dest_dir}/buildah.registries.conf.sample
>> +    install -m 666 ${S}/src/github.com/containers/buildah/tests/policy.json ${dest_dir}/buildah.policy.json.sample
>> +}
>> --
>> 2.33.0
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#7324): https://lists.yoctoproject.org/g/meta-virtualization/message/7324
>> Mute This Topic: https://lists.yoctoproject.org/mt/91344690/1050810
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

