Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7504CC433F5
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 19:47:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.210.1652989666250788842
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 19 May 2022 12:47:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=amolLbGm;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=2138eb3cae=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 24JJS93E031576
	for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 19 May 2022 12:47:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=vDyltJC7LX5BVneDI4XJROp914NwOZk6nZmfXxev62E=;
 b=amolLbGm3XsH3AeXrOd6YKHXwABFY9c9wfxjzGjyfyLmmWGh60/9Qb6CkK5xQ4zxWNaE
 PTEgug2YfwpI3IwOuTPc5B/siu9m4FYQbIA4B4CULNgzmKb7zmCr4OBev3CqEnwVjHUC
 Nkb2TyQU2rZVUAaHrhfWLVtw4JWTIlt9D/gcmCurWc8Pa1hhu8Q/qDG9CeMDfDw+6I05
 3OKBpn9uAIiSRWYjoRKKC7M5lRjwqpQuSXIACG4UkrI3emV23H20jXoVTDhdlEAc0YSc
 mON2KZWySbO97yLqShSNlbrggO44ppfygWqAQapn391+3SmIz6SHojeCzkG2FOSjKW2q 5g==
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2049.outbound.protection.outlook.com [104.47.56.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3g2bxmvd2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 19 May 2022 12:47:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CEJRKfXwOHHNLd/CYchYgvzlplQhMW3vZEYNhwTMpa8SPgylOkziiC/UorL2V2ibIgaJz1Dp/Wo2+2nY3sirzHcWxgq5EUnx27fpZYpuJoj9f1O3+oCNm9sQD1D2sxdgbbAl2fqJX3Y/425H3R7zEMklYqSuTWYLSBDPJskXHOFV0tURfDJLaUhlV2eHcqsh1IUE+VSodM3SmtBhUBrmT7xOuu10XSeM9HyHT4eZZ1KwnIxi72+VuiO+nKIiqgq9IZtRuso3XQtI6fTyt8bTRjFGHbj1o9cjhNbtyt3ZcXUyRppw8oVAsX+QTmIv237nV/DcyE+afhQTMb1GMu+pwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDyltJC7LX5BVneDI4XJROp914NwOZk6nZmfXxev62E=;
 b=BtZc7LdObngW+9TU+MMIlA27bvE5+XVDqDIsYj4PfhVBFNNlk1zNXxpwDh8oKljXGdrbf9X1yOYTF1Giln/m0Fn3aISUcVZ8u2KeuvKy+3aulTuXzUBuPZEJkNb+9iZ0geD3nr9V8UaT0sDlrxvFA8kCIIGLuMutwQR648wMWdeocmUzctJ2/02POo2219oCC19xUOo+y13ps5PiAHdE/5+knztsL7XDeb+blnjlPyNL37eKUJ1YEzE7o3ERGn5k9X+vhx0EHxvRiv47TVAe2KI/rI8fkgsAhCniko0SAxwdZXVOBi3tYIGyTlkZ6NHuK2a6yaW0XkN78GOT+bqtFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 SA0PR11MB4655.namprd11.prod.outlook.com (2603:10b6:806:9d::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.16; Thu, 19 May 2022 19:47:43 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::7cb0:dc6c:b2b3:b69b]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::7cb0:dc6c:b2b3:b69b%5]) with mapi id 15.20.5273.014; Thu, 19 May 2022
 19:47:43 +0000
Message-ID: <9346ac7c-0add-8620-1b98-d637fa2437db@windriver.com>
Date: Thu, 19 May 2022 15:47:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [meta-virtualization][PATCH] podman: do not build or install docs
Content-Language: en-US
To: meta-virtualization@lists.yoctoproject.org
References: <16F098E694D93553.30875@lists.yoctoproject.org>
From: Sakib Sajal <sakib.sajal@windriver.com>
In-Reply-To: <16F098E694D93553.30875@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0128.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::7) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ecd0666c-ded6-441e-0c67-08da39d070be
X-MS-TrafficTypeDiagnostic: SA0PR11MB4655:EE_
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB4655DE65A91126BFDD85DC6AF2D09@SA0PR11MB4655.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IIjN3kcaJKSY9Ia1xFkyQOgXrKKp0kUL1/Tcp0SjHv6VsTB/ewA4XrkPFWqktmbKjpmeqWdPPu8ARPj3xjC4UUMe881ukXnGY4CCZUF9XMHS2hbJEvcSR7MgQKqlo2kAIX9oWKK8ah63QrgRZ+WNRmWv1R1pkA2bPcCgOn6Ir9VrTB489irEM6UCVg0qf4M93IWA6j+NrXycYt0+V3LC8poGx8llQN35inrzav6zEasZEIhv/3Ng5YeCeiT8jG8Wd+QeNC+isspyyqax5T/z8UQ0muiy0RcK0mqsaai41guOeVM0eOzCS2dux179IsiSMe+NXFbY10ZQhtNXs/viGuEb9F7/ljUSR2okPAilpKYUmaYw6Hv0XRyagGv9jZSg52GYXhG37gfPD6rRSTee/FAwoZ1yXx43Sv5DXHlq82vGMxPG91nZS7wEhRQ6xIJh3+PxDj8+FCeqyc0iXjl2kA4NO+O4sVJrI+CmH1wcWRonarJ55zcsnT1Dg0y+JeFPuLEgJ30FRpzskMVqoQIVm37exZZkabeNie+/7/FHsW20Q+Fbv7HXBKhH/5b0MDJ9PPfd6fyvJQgsFBcgfLyjrQnz410EHMWWiT13z9YV/Dvn5ObpJ8/P4DLqqFu5T33Iy10Fm0GNFCBronw256yWq4LSJr4bNdtXyUlYA4s7tod19w96HGJ5n+jlNf+Xy+/3PXqcFvwl80JI8XRmvCTtn1Ua1ZkkcT0Z/fnryvIbEe1d2R3UrvWYbFC66c+5rs/J77RAJuUvsxXcDUcexmbdzsPBRKSZG4V+AFIE1tQumWdE2ugQZ0YhCLDmzQf6fRE2iMQNdGxJLeVCAH3hCB6cCVHPqo0w8ih3983FhCFucjGwDRlo+TqDpLZSbhIBizsk
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(66946007)(66556008)(8936002)(31696002)(6916009)(86362001)(8676002)(316002)(2616005)(6666004)(6512007)(26005)(52116002)(6506007)(53546011)(508600001)(38100700002)(31686004)(38350700002)(6486002)(966005)(2906002)(83380400001)(186003)(36756003)(5660300002)(44832011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b1hJUUluZ25BNW1rQWF4ZmhyaTc5SURCSnJpNFQyNTk0NWtwRnN0MHBFNGJP?=
 =?utf-8?B?VVorb1I3RmcvYXpkcjVJaHZhckNSNDR6a2xSVW51WGZBdjRNS3pjaENnNjFU?=
 =?utf-8?B?M2xxTGx2MFM4dFpVdW1zbm5tbEN3bW1wczFwd2NuZ3UxRy9LZEZtaVlnMmVK?=
 =?utf-8?B?UWZBbVRMMU1WWTBhOFVSS0N3bGlDazhWMFAvUEFyUUc4UWYwS0ZKSE1CMFBG?=
 =?utf-8?B?OVlVTXM1cnhZRm1hSy92MmllWkRFeEI3dGx3aTdKWS8zNk8rRWRaT3VNZDdH?=
 =?utf-8?B?OGZQUTFSOXI0d21HMnNxazZLaWtmSWJTUlAyeFdyVno3c20rUVU5S1NGb09B?=
 =?utf-8?B?YVhFZWpobWxWRytvbUhkR1lONGFRTFlUajdpWCszZUZQVHljNzRvL0JMa3BB?=
 =?utf-8?B?WWNzLzJXelpQd3V5Wmo3Z21qOFUvTlc2dlgvaHRaRkpjSi9zbVRtSG15enRT?=
 =?utf-8?B?VmNMYVNmR1ViZmtaTTNEOG5adkFqR2NzRVlsUkFpRklyOFZpbXA5VEdodjBO?=
 =?utf-8?B?THdtWGorc0ovcngwUThablNqZlMyMFBaa3lNck91bDVndExMdjM0RTRIQWh4?=
 =?utf-8?B?WEVJYVNnMTZDWTBCOW5pV2ppdGNnZ0o0M256UE9BVUxIOW5BWkF2VVVZRTh6?=
 =?utf-8?B?NTB5cmFocVBZazVjQ0hxb1pMVmdaY0MxK1hyeEE0SEFwZVJydzZVMFllWXo4?=
 =?utf-8?B?RzZvRTBkVWhCRjQwSWRhblF1S0MxTmFpUlJwTFNCUGd4c2R0QnJMOHRTUXdh?=
 =?utf-8?B?YVlTRE9IdHl1UFoxT3I5UG5uYy9TTG1yMmVmWnpGUHVRRVVMcUtXVWpDYWV1?=
 =?utf-8?B?UUxCbWtLNVJtZkh0b1VLcVRUQzR2dy8zbEErN3FRa045djhIS3pZUjF5WjFW?=
 =?utf-8?B?ekc0LzFyNmE3RFdpL04zZHlrcVB1bkNhcEpBOHJoWkJrVUE2STkrVnFnbDI0?=
 =?utf-8?B?aVZKcGl2a0JzclFVRmpBNVBtYUl5Z3VpUDYwOURxUnhlbVYyN3lTZ21QVDNZ?=
 =?utf-8?B?T0lqQ2JOeGsvTFNKYUxVTTZ4eVdxMmFXR0RuUyt2VmdITG1hVUY5anM5M01a?=
 =?utf-8?B?aWh1YTFpZURMMUZEcm5qZWdhZ0pTRmpWZ1pTem5JdFlEWEFiby9WUkNoSng3?=
 =?utf-8?B?YzBUejdoRTBKRWtBdkNKNXF5dHhQd0R6bkVuRExReFJ6eFhTYXVMZE1zSVIy?=
 =?utf-8?B?cURPajh5K0JIWktEbTlFZXhlWEgrcFVpZUJuZHlJcndvL0ZIYzAzQVBpT1d4?=
 =?utf-8?B?bEl4cmt0Vjh1RGpSZ2o5Z0pHOTBvS3FEak44dVlRajlhYmxYaG9rZjBuTHRu?=
 =?utf-8?B?WUcySWpoaG5rckpaQWJNSDN2RjJKY2VJUldXenJvcmxhM0hVMXFoM1ovSlhK?=
 =?utf-8?B?eHhkSkpBMFpqUEk3Yi9OQ3FCS3kzVkNMOG9tU2htaktuditPL2ZYdUhtcEk5?=
 =?utf-8?B?ZFhvTjZ6bHFsUkFHRUhZRC81anBudTJ2N3V6Snh0THZ5Y3UrNkg4aU9CUnpj?=
 =?utf-8?B?RWEzTUZtUEJVQjFYSllHR2VLSWExc3hvU0l2cFhmMWxnc2NOOE5GL3hKQnhO?=
 =?utf-8?B?Vm9sT2VSbWF6bDFxM2xuOXNDKzZuby82UTRpUmE1K04yb3J5U1pxcGJJbTd1?=
 =?utf-8?B?TXFSdnp6a0xubW4zRE92Y0JubERhcUVxU2ZlWS8xRDJ3ZEdicHM1ek5yejlT?=
 =?utf-8?B?MDBLMllkRFRCSEUzMVJZbS83MHc1eDJwdVc5c2l1VWhnK3h4S0svSkl6a1BT?=
 =?utf-8?B?dDl1Ryt6ZTZ0TmtzS1FjV25xSjlKOUZ5dHhqSjg1YUdmMjBtWldleHhhT2tE?=
 =?utf-8?B?WDFObVJzckNyVnEvTG5XVG50L0JqK3h6bmplV1FCNnFpZHMxbzEwZk92R2pL?=
 =?utf-8?B?OGI1V09nTkZveFBUSUNVQVdVL3Z4aVV4cFB4M0llVnFvWWJUMzFXdzY5SC9F?=
 =?utf-8?B?U3J6ZUcrNGJXRlNsUmZjR1hzVzZZTWVMVWc3TnNEUWpEQmhUTlEvZ1lqcXVB?=
 =?utf-8?B?YytwRmlNRDlnbVRqOGQraDRqK3h4SkFiaUtrOW14TGpKQzVBcUFzZnRPbEdB?=
 =?utf-8?B?T1I3MFNhb25CclpZYzVpMDBOSUk4MnZBcmZCU3crRXB2OStGQWh6NXJuYXNR?=
 =?utf-8?B?NTdoczVjVlI4N1NEV1RFSUxkWkx2YnU1VzJmYVdrbGkvK1lBV0dWajlGUExl?=
 =?utf-8?B?b3RpOXpzL2ZrUmZsOFp0aHBLVmVWa3puMHVnQ2RlZHplZXNsSklQQlJ3YlBD?=
 =?utf-8?B?YUFpYi95Z2NwRkQ2WlRmYk5wVlVCbE9ycG5SNnFLTDJidldTMjZFOTJrcWp3?=
 =?utf-8?B?SUNpVS9YK0g3OTZPN2h4WXhDMW5vbk1wckVmeW9DK3RHR0VIL29ybEZhdEF4?=
 =?utf-8?Q?sPUhIg7USLz1nK3U=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ecd0666c-ded6-441e-0c67-08da39d070be
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 19:47:43.5549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 rpjjOcPoq+/aJtQkL/Tp7rVawYSynQY96PGCXYP2LOWifVQDkJUJrOS57wTIgbpQkIu4euSukKMgJJks/LOuJwFs8Gzcgk85bkEQcInQOzo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4655
X-Proofpoint-GUID: XQqokFX0eUFHatXM4S4CnMI70Fj8XShZ
X-Proofpoint-ORIG-GUID: XQqokFX0eUFHatXM4S4CnMI70Fj8XShZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-19_06,2022-05-19_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=972 phishscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 mlxscore=0 impostorscore=0
 clxscore=1011 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205190108
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 19 May 2022 19:47:47 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7291

I would love to resolve the issue, but I am trying to make progress as I 
am going to submit a recipe for buildah which depends on podman.

Sakib

On 2022-05-19 15:39, sakib.sajal@windriver.com wrote:
> When using oe-core, podman do_compile fails with the error:
>     .../podman/4.0.1+gitAUTOINC+717edd7b84-r0/recipe-sysroot-native/usr/bin/go-md2man:
>     No such file or directory
>     make: *** [Makefile:482: docs/source/markdown/podman-attach.1] Error 127
> Whereas when using poky, the build passes without issues.
>
> Investigating the native go-md2man binaries from both oe-core and poky
> builds using ldd, it appears that the issue lies with how go-md2man is linked.
> On oe-core it is linked to the loader in recipe sysroot:
>     tmp-glibc/work/x86_64-linux/go-md2man-native/1.0.10+gitAUTOINC+f79a8a8ca6-r0/recipe-sysroot-native/usr/lib/ld-linux-x86-64.so.2
>     => /lib64/ld-linux-x86-64.so.2 (0x00007f4da90f0000)
>
> whereas on poky its linked to sysroot-uninative:
>     tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
>     => /lib64/ld-linux-x86-64.so.2 (0x00007f9c82c71000)
>
> I have confirmed that this issue exists on both Ubuntu 18.04 and
> Fedora 35.
>
> Rather have this fail for people using only oe-core, skip generating the
> documentation for podman until the problem can be resolved.
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>   ...efile-do-not-compile-or-install-docs.patch | 35 +++++++++++++++++++
>   recipes-containers/podman/podman_git.bb       |  1 +
>   2 files changed, 36 insertions(+)
>   create mode 100644 recipes-containers/podman/files/0001-Makefile-do-not-compile-or-install-docs.patch
>
> diff --git a/recipes-containers/podman/files/0001-Makefile-do-not-compile-or-install-docs.patch b/recipes-containers/podman/files/0001-Makefile-do-not-compile-or-install-docs.patch
> new file mode 100644
> index 0000000..1363ee8
> --- /dev/null
> +++ b/recipes-containers/podman/files/0001-Makefile-do-not-compile-or-install-docs.patch
> @@ -0,0 +1,35 @@
> +From 7913cac21842f56ae9752fb0c253f838bab04ae8 Mon Sep 17 00:00:00 2001
> +From: Sakib Sajal <sakib.sajal@windriver.com>
> +Date: Fri, 13 May 2022 13:06:29 -0400
> +Subject: [PATCH] Makefile: do not compile or install docs
> +
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +---
> + Makefile | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/import/Makefile b/src/import/Makefile
> +index cb230d8e9..7e07ab61a 100644
> +--- a/src/import/Makefile
> ++++ b/src/import/Makefile
> +@@ -202,7 +202,7 @@ GV_SHA=e943b1806d94d387c4c38d96719432d50a84bbd0
> + default: all
> +
> + .PHONY: all
> +-all: binaries docs
> ++all: binaries
> +
> + .PHONY: binaries
> + binaries: podman podman-remote rootlessport ## Build podman, podman-remote and rootlessport binaries
> +@@ -754,7 +754,7 @@ package-install: package  ## Install rpm packages
> + 	/usr/bin/podman info  # will catch a broken conmon
> +
> + .PHONY: install
> +-install: .gopathok install.bin install.remote install.man install.systemd  ## Install binaries to system locations
> ++install: .gopathok install.bin install.remote install.systemd  ## Install binaries to system locations
> +
> + .PHONY: install.catatonit
> + install.catatonit:
> +--
> +2.33.0
> +
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
> index f805cb6..8339a16 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -20,6 +20,7 @@ DEPENDS = " \
>   SRCREV = "717edd7b844dcd66468f5d991991d87e9fc14c12"
>   SRC_URI = " \
>       git://github.com/containers/libpod.git;branch=v4.0;protocol=https \
> +    file://0001-Makefile-do-not-compile-or-install-docs.patch \
>   "
>   
>   LICENSE = "Apache-2.0"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7290): https://lists.yoctoproject.org/g/meta-virtualization/message/7290
> Mute This Topic: https://lists.yoctoproject.org/mt/91216450/4422444
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [sakib.sajal@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

