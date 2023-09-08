Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D07EB8FB1
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 02:31:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.31226.1694140289768576489
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 07 Sep 2023 19:31:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=hvXVCDcs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=761528df65=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38818pHV029803;
	Thu, 7 Sep 2023 19:31:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=EjznPZzL1WCJu4SVb+lblYhXmtEcbc96ioUKyccF2yU=; b=
	hvXVCDcs/0rmcPlyIpKyTyt9VHB0bBKtG7BZJOkF42Mi9PBjIIoc1dEKOLqumdMC
	22dNMJDY+PMTYs6QLaBYa+xhJXT7dJbLKOgbOPSvETwtsSbrlF+A+oRKboWrtvyg
	Cx7/hd4ErQG+5JUKjRtQI11aGYPeA49pWJ3fvFxktbOCD6DlLzqEsBeSTLZja99b
	RQICv3a1EGAg0PoXXZgHU+gitEj6sza8aPQQIh1EICA8rS2ssK6Zs5EXNYUKQX2b
	XFbEKqgFLdaTuPunq+6uo5xgdL3oXiYv9UMNa2h+mgMeF7kJR1HPiW8/Weo9YEpN
	pIRR7noCNHdoVJ6Nt8kW4Q==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sv4jg4whc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Sep 2023 19:31:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IWxtrixbFWaG/yBiTzIgG85EPJFxmAyp7e0wR02BU/y9mUy3kMLGeKEWmDxC5Bw86zOcXihVoX++OJd/YTVPAiIQi2QKdskq+Ar4du69YWKlxtqT0wngPmLXfeuZcMhpEYQEF8keSDzI5L0yiDP1HLNtJDzp6X1eTMwKe69kk1E9mbkUFZWhXEnXFXqkko7fxb7dxecUTXXrDBmROTKetB00Ywxj000BH6FnQGsWSSTg58+eZgVAQD80HyFqyrBhHcH3Xj28IFfRAr/jyB7VWlmb7wg1wthZn7G27i3YjnM9jWyMJ6hE+1wMODcy8BWcZdCnC49R8QJLPYnv/V8GKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EjznPZzL1WCJu4SVb+lblYhXmtEcbc96ioUKyccF2yU=;
 b=WsfBvPc9qeLoEyXhiYgyqAYWxyF+nWH7cb2zG33HnTeIMq68GB98kpYgZM1RO5uR5L6DFo3A2sHAmTiUoP/1DxVIiqt+G4kjhAHgNvWUYJi6h/l2T2EWvCYrp1LCJmbETB2kiWrn1JY/UPhlpgggIOFQwLKGJFip23DZZSoC/gvqPPRsc0RDhmmv8SPAcvA1Jq1HxyxbspGwtaRCZECLHIfRLWXJDNFcjDdd29Do2y9R/kAYgzZ4Ll7dhJ8laMyXsTUwT/45w71Vc4YaIzd/6q9QKEXcmYE2Z+wVZ52nk+O8VpQ/UNdGskRXARm0qPK2qotTD/El27I4QLJzTAj+1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH8PR11MB6951.namprd11.prod.outlook.com (2603:10b6:510:225::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Fri, 8 Sep
 2023 02:31:19 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d%6]) with mapi id 15.20.6745.034; Fri, 8 Sep 2023
 02:31:19 +0000
Message-ID: <cf4bc1d7-a251-13c1-528c-8d0db2b6ef81@windriver.com>
Date: Fri, 8 Sep 2023 10:31:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [meta-virtualization][PATCH 1/4] oe-go-mod-autogen.py: add script
 to help adding/upgrading go mod recipes
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20230905032203.1896328-1-Qi.Chen@windriver.com>
 <CADkTA4MoM3R7Nu1XgQE+ORYN+oJTa8ubimBrZoWCubk21U93dQ@mail.gmail.com>
 <6f6a39cb-488e-b4bb-4847-475fb29c517b@windriver.com>
 <17822F6A670423F9.2662@lists.yoctoproject.org>
 <CADkTA4NA-sZKYseM-qDKWPnLf4nUh-u=R1hyeJoV_VGjF3269Q@mail.gmail.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CADkTA4NA-sZKYseM-qDKWPnLf4nUh-u=R1hyeJoV_VGjF3269Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0034.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::11) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH8PR11MB6951:EE_
X-MS-Office365-Filtering-Correlation-Id: be473d13-36ab-412a-2206-08dbb013af27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OVJsrwfJW0NYB/xb8R6LlN1ycRSnjtNfiQLs2sxjyidU2siPNhlsernT9QqmQe6xYSBA6EFnT2kzIx5LXrCEkz2SFfc1+XWf5rCoITttfAXrjEubsEOTLiq5bse8eIavjAvkGL9L+3w19FCYzLaYNG1ydLKuNmRUXbnI4mXQYxybMrap4Kja8Evt1Dvm/4MdE32yigueUdxpg/+roaUJPFxfc2EwPADD2FfiIEv+An3ddGMSSwm+EqZs7NIYwhuNigSAbLGdAGxMyGulGXgwbppW6uNkel/DWjAkGx/jOI/XDhMeTF8MdJG5MsVVC9wiWV/vSwvvE8KABWBx0Fk2MOTGNvwTTIERxA3OqGVjaUv93vrmOuPoVholshbLu6ow2tJicJeMFCwSc78QBrweWDryEcFqfGD8AywcnOuc/ekTWLOn1w4X9puf1EuITemFI2ubN+vx/CERVOQteJmYDSHea7+syMsW+rhomAeRw8bSCtACkfPPNJPSvwfgrHOcYzZKQyDmr4pVGQ4d8CTnth44E5JehNqWvJPIOKdRlo4pczsRwPrtPcstz1ub4qCLmDAXTKRjtJ56zFsgXhAi4f+Q3S0DZdDfs1PM7iuSSLj+RmHZQwAYCCxNBg9lpL3ZZ5B1Reag5wDmnCkUGBS6DyraPvpKoAhheXjo/7KiLoQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(136003)(376002)(366004)(346002)(396003)(186009)(1800799009)(451199024)(66899024)(6506007)(6512007)(53546011)(6486002)(966005)(2616005)(6666004)(86362001)(478600001)(26005)(31696002)(83380400001)(38100700002)(66946007)(4326008)(5660300002)(6916009)(316002)(66556008)(66476007)(8936002)(36756003)(41300700001)(8676002)(2906002)(30864003)(84970400001)(31686004)(21314003)(45980500001)(43740500002)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TXBHOURMK2R2NFl1UkVnWkhGVUtDY05xSjJ3aW5MbUhSWGlvYW5vVklmaXJG?=
 =?utf-8?B?UzhDK1l4YVB2aDZtQjBvTit3eXBBUmQ2MDh0UTU0YUM1KzFmZXdvcjdqSEpl?=
 =?utf-8?B?VE9sTEZKYno0RFJuME0wODkvMC9abXFMajM3ditrKy9sMzBsUWdZc3dqdzZs?=
 =?utf-8?B?bnUwcFhnWWxMeDFLZ1RUSzRZaUwxSnlMQyt0T1VNc0hZNTBKZ2ZDRE9MSzZr?=
 =?utf-8?B?QmJTRE43Q1hacVJxeHNBYVNhampnT05WMndPUXV3OXhWN0dCa3o3bC9UWTNL?=
 =?utf-8?B?UnJqQ25tU3Y5UW9XdDlrenB4YVNTTkVrdlRWTmw4ekJKcTFsR0hCUElWZTcz?=
 =?utf-8?B?N0h6ODV5NGpUVE9RVWtxWW0ydUhza0VHbFhUcDM5aWUwNnVaeEIzTEY4U3kw?=
 =?utf-8?B?ZnkzMnhjUXg5NDMxTHNhemVrSURralo3RGFOcTE4ajNDSHBrVGRCS2lUeG9o?=
 =?utf-8?B?ZmVDM2ZvcE5qOFNxbk1IQUZ0ZnZmVGhWRE9iKzBMQVFXdFNMTkpTRGRHdlhY?=
 =?utf-8?B?OUt0aHpLYUp2Y3gza0FIVmwvUE82ZDlFSjJNZDBkOXA5ZE9aZGx1MFBtMUc3?=
 =?utf-8?B?QnlYUk01TjBHQmJpL3FVNkZhTUJOSWVmV0lkTXltd3RSTzBMSDBLTzFFbGE4?=
 =?utf-8?B?dHdqWFoyNFdRNmVXdCszTFJKclR5NC92Qlp1L1p0VklVUzIvWHZMUXRaTHRK?=
 =?utf-8?B?am9MbUk5Nlo4T0dMMElIc1ZCV0FYb2dYbnJKcjFxUitXNVQ4SHFGT2ovaFNB?=
 =?utf-8?B?NEhYdUZaeU9CTHpIVnIwQnRTVFR5RGlERHNIZGJ1cHNMUzR1azRKZTQxalNX?=
 =?utf-8?B?K043UkJYMzh4M05PRUltOFdZeW5YY28vNGNtNEVlWVQ4RGVqazZqdHBCTlVX?=
 =?utf-8?B?WUxsbFM0ZkVsNVl2cFkzSDJHMmxXMXlVenZQajhZd013YWIwakM0bmJ0dS9x?=
 =?utf-8?B?QUJUaFJ2NzYxOWNiWFR4SkFaWCs0RkkvRkZMbllGc0R6VnMxaE81QnJCQzdZ?=
 =?utf-8?B?TW1odlI1ekdSWEdhSG96a2o0UkhkUnZkWmRmL3hzVjB2ODB3cjBNdzFVSlhj?=
 =?utf-8?B?REJseGpnbk4yeUE1dEhPdVFLdm5aNGZYc3pjdzdvcm9jUm0wclRNczd3REtz?=
 =?utf-8?B?VGN4TnlMNVJ5WG5Zc1pkcHNmSWpLVGRPSzUvYnBqSTRxS1pFeG1YSERnTXhO?=
 =?utf-8?B?NXBPcnRkRkltdjBIRU1CWTgyTWVDd211S2owd092aXZ2SmQ3YUxiaEFaaWx6?=
 =?utf-8?B?QVhpaHpjdUxtRGxFU3ZPZVBxODZLc0lXVks2S3ErclorK1BTbkRIOE4yeFpu?=
 =?utf-8?B?RHRBeUUvUXRZTlpyU0dkcENqS0lZQmdLblNIdzF3VDQvc1Y4NUd5dWZvUFZJ?=
 =?utf-8?B?emhnYTAvSmlyWHhUVzF4eVFKQXJzYml4K1piSTFHSERFSkswK1ZVSE1icEJB?=
 =?utf-8?B?WndLTGdOSVM0Rm9vVlp2bDJOVVFPc3h1dG5wc2RkeEFHKzNGbStEaFIweFpJ?=
 =?utf-8?B?WDIvTHRPZ0lmR28wZGdYWDJnOXBzNkZIbWQwOFBzMXdSQnpZb2ZzWWFnQ1dp?=
 =?utf-8?B?K0FXWFk5aVBOWWZXMDhoRVUzNFNjNmNFSnhvMUpxeHhCNHR2Ums0STJyZkhv?=
 =?utf-8?B?aTBJeGk0R3pqa0JEMHovemIwTUJqUzdnT2YvSXlzMDYvUjZJRFZzT0ptd1lG?=
 =?utf-8?B?VFRRV2puMGpYZUNsRG1pTFdaZlVLZjIzd2hnQjMraktNcWloY2xvVUxxOEhX?=
 =?utf-8?B?WDRMNFJjYWw3WjBoRmVnOE1PNEgrNW1LTVVTcGcyNHZnelM0MW1OQXlKd2Ev?=
 =?utf-8?B?U0FwSXN3MlNHV0xaMm5EcmRRSitRSVlyT1RLaTEzRmpRNzMyY0RrNjhIbll6?=
 =?utf-8?B?YWw5QmMwb2xoa0FxbnBSRkdVcFNGMUhWcG9lM3RyN0ErWHJTWFFOVDhpcDlW?=
 =?utf-8?B?QWNyYWpHaDI4aFU1ZjBObkZqQWRmMFpqNEIyQW1BajZSWHkrbGhPVVRFYmZH?=
 =?utf-8?B?cjlTc2NOSFArZ0Q2YjhDRVJoVytqUkNKd0NEUkNWL2NpUGwxOGl6VjRrWjlr?=
 =?utf-8?B?WFVldktiZjIrbmFuZzYrbkJ5bDhmeVhna0haajNHZU9mSEcrRUN5bnNZVWwx?=
 =?utf-8?Q?r59sgsovza8CW1E/DyWo0lh3O?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be473d13-36ab-412a-2206-08dbb013af27
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 02:31:19.5698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VhoFroy3OQX8x0fy4KTEY9sh0ejluOHj2J0JmjFDWeVXlyzgXLon3olgFxMDEEAEtM37D6TfdftYNFTu/n1yDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6951
X-Proofpoint-ORIG-GUID: HybsqplK0PFyGZhSU8MxKZSIM0YS-46l
X-Proofpoint-GUID: HybsqplK0PFyGZhSU8MxKZSIM0YS-46l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-07_15,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309080022
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 38818pHV029803
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 08 Sep 2023 02:31:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8285

On 9/8/23 05:09, Bruce Ashfield wrote:
> On Tue, Sep 5, 2023 at 10:49=E2=80=AFPM Bruce Ashfield via
> lists.yoctoproject.org
> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>> On Tue, Sep 5, 2023 at 10:41=E2=80=AFPM ChenQi <Qi.Chen@windriver.com>=
 wrote:
>>> On 9/5/23 20:26, Bruce Ashfield wrote:
>>>> On Mon, Sep 4, 2023 at 11:22=E2=80=AFPM Chen Qi via lists.yoctoproje=
ct.org
>>>> <Qi.Chen=3Dwindriver.com@lists.yoctoproject.org> wrote:
>>>>> From: Chen Qi <Qi.Chen@windriver.com>
>>>>>
>>>>> oe-go-mod-autogen.py is a helper script for go mod recipes. It foll=
ows
>>>>> Bruce's initiative about how to deal with go mod recipes in OE.
>>>>>
>>>> I thought the techniques looked familiar!
>>> Yes, indeed!
>>>
>>> With golang's current scheme, your approach is the only way to 1) mak=
e
>>> these non-vendored go recipes build without network connection at
>>> do_compile and 2) conform to OE's download mirroring mechanism. This
>>> really helps a lot!
>>>
>>>> I was just working on my script before my holidays as my uprev cycle=
 had
>>>> taken me to the non-vendored go recipes and I was running into a few
>>>> corner cases.
>>>>
>>>> I've got a K3S upgrade already done locally with my tweaked script, =
but
>>>> I'll take this for a test run and see if I get the same results with=
 this.
>>> I did use this script to upgrade k3s to 'v1.27.4+k3s1', only for the
>>> purpose of verifying this script. Those three files were correctly
>>> generated and the build succeeded. Hope you'll get the same result.
>> I'm testing the k3s update now, and there are some differences, but
>> they are minor and the vendoring looks good.
>>
>> I'll follow up once I've done a bit more testing.
>>
>> I can take care of a draft README for the script, and I will likely
>> bring over a few of the elements of my script (the ability to do some
>> module substitutions on the command line), but otherwise, I don't
>> see a lot of gaps .
> I've started on a README describing how to run the tool, and have
> spent quite a bit of time with the script now (I was using more
> heuristics to find the source repository, but using the go VCS
> information makes things work much simpler .. which is of course
> what you are doing).
>
> I've also ported some of my changes over (flags, and the ability
> to track a branch (which I now realize I probably don't really need).
>
> That being said, k3s is now failing during processing:
>
> WARNING: Revision (ec00e662324e) not in
> repo(/opt/bruce/poky/meta-virtualization/repos/nats.go)
> WARNING: Failed to get requiredrev, repo_url =3D
> https://github.com/nats-io/nats.go.git, rev =3D ec00e662324e,
> module_name =3D github.com/nats-io/nats.go
> WARNING: get_url_srcrev(github.com/nats-io/nats.go,
> v1.27.1-0.20230619112143-ec00e662324e) failed
>
> I'm looking into that issue now.
>
> I had a more complicated semver regex to pull out the revisions, but in=
 this
> case, it does appear to be looking for the correct revision in the repo=
sitory.
>
> I'm out of time for it today, but will continue working with it tomorro=
w.
>
> Bruce
>
Hi Bruce,

Yes, I just double checked the https://github.com/nats-io/nats.go repo,=20
the resivion 'ec00e662324e' does not exist.

In k3s master branch, there's a commit to bump its version.

-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 github.com/nats-io/nats.go v1.27.1-=
0.20230619112143-ec00e662324e=20
// indirect
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 github.com/nats-io/nats.go v1.27.1 =
// indirect

But for v1.27.5+k3s1, the go.mod file is using 'ec00e662324e'.

I've filed an issue for k3s: https://github.com/k3s-io/k3s/issues/8320.=20
Let's see how k3s community responds to this.

Regards,

Qi


>> (I was doing things like generating the relocation and src_uri
>> information in one run, and the modules.txt in another, but these
>> aren't important features, so I'll won't worry about them
>> when consolidating the tools).
>>
>> Bruce
>>
>>> Regards,
>>>
>>> Qi
>>>
>>>> I just didn't have the time to clean mine up to make it presentable,=
 so
>>>> I'm hopeful that this will work and I can take that off my TODO list=
!
>>>>
>>>> Bruce
>>>>
>>>>> Example:
>>>>> cmd: <path_to>/meta-virtualization/scripts/oe-go-mod-autogen.py \
>>>>>        --repo https://github.com/docker/compose --rev v2.20.3
>>>>> output: src_uri.inc, relocation.inc, modules.txt
>>>>>
>>>>> Copy these three generated files to replace the original ones,
>>>>> then we only need update PV and SRCREV, and docker-compose is upgra=
ded.
>>>>>
>>>>> Below are some technical details.
>>>>>
>>>>> * get module's repo from module name
>>>>>
>>>>>     This script checks the following two URLs to determine the modu=
le's repo.
>>>>>     1. https://<module_name_tweaked>?=3Dgo-get=3D1
>>>>>     2. https://pkg.go.dev/<module_name_tweaked>
>>>>>
>>>>>     The module_name_tweaked is derived from module_name, with the l=
ast components
>>>>>     removed one by one. Let me use two examples to explain this.
>>>>>
>>>>>     For module_name sigs.k8s.io/json, the sigs.k8s.io/json is first=
 used as
>>>>>     module_name_tweaked for searching. And we can correctly get the=
 repo URL, so
>>>>>     the search stops.
>>>>>
>>>>>     For module_name github.com/k3s-io/etcd/api/v3, the following on=
es are used
>>>>>     as module_name_tweaked:
>>>>>     github.com/k3s-io/etcd/api/v3
>>>>>     github.com/k3s-io/etcd/api
>>>>>     github.com/k3s-io/etcd
>>>>>     And when searching 'github.com/k3s-io/etcd', we get the repo UR=
L, so the search
>>>>>     stops.
>>>>>
>>>>> * determine the srcdir:destdir mapping in 'vendor' creation
>>>>>
>>>>>     To correctly form the 'vendor' directory, the mapping is critic=
al.
>>>>>     This script makes use of tag matching and path matching to dete=
rmine
>>>>>     the subpath in the repo for the module.
>>>>>
>>>>> * avoid subpath being overriden by parent path
>>>>>
>>>>>     We need to avoid subpath being overriden by parent path. This i=
s needed
>>>>>     for both SRC_URI ordering in src_uri.inc and the sites mapping =
ordering
>>>>>     in relocation.inc. This script simply uses the length as the or=
dering key,
>>>>>     simply for the reason that if a path is a subpath of another pa=
th, it must
>>>>>     be longer.
>>>>>
>>>>> * the .git suffix is removed to sync with each other
>>>>>
>>>>>     Unlike normal recipes, go mod recipe usually have many SRC_URIs=
. This script
>>>>>     remove the '.git' suffix from repo URL so that the repo URLs ar=
e in sync
>>>>>     with each.
>>>>>
>>>>> * basic directory hierarchy and caching mechanism
>>>>>
>>>>>     <cwd>/repos: hold the repos downloaded and checked
>>>>>     <cwd>/wget-contents: hold the contents to determine the module'=
s repo
>>>>>     <cwd>/wget-contents/<module_name>.repo_url.cache: the repo valu=
e cache
>>>>>     This is to avoid unnecessary URL fetching and repo cloning.
>>>>>
>>>>> * the ERROR_OUT_ON_FETCH_AND_CHECKOUT_FAILURE switch in script
>>>>>
>>>>>     The script must get the correct repo_url, fullsrc_rev and subpa=
th for
>>>>>     each required module in go.mod to correctly generate the src_ur=
i.inc and
>>>>>     relocation.inc files. If this process fails for any required mo=
dule, this
>>>>>     script stop immediately, as I deliberately set ERROR_OUT_ON_FET=
CH_AND_CHECKOUT_FAILURE
>>>>>     to True in this script. The purpose is to encourage people to r=
eport
>>>>>     problems to meta-virt so that we can improve this script accord=
ing to
>>>>>     these feedbacks. But this variable can set to False, then the s=
cript
>>>>>     only records the failed modules in self.modules_unhandled with =
reasons
>>>>>     added, people can modify the generated src_uri.inc and relocati=
on.inc
>>>>>     to manually handle these unhandled modules if they are urgent t=
o
>>>>>     add/upgrade some go mod recipes.
>>>>>
>>>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>>>> ---
>>>>>    scripts/oe-go-mod-autogen.py | 663 +++++++++++++++++++++++++++++=
++++++
>>>>>    1 file changed, 663 insertions(+)
>>>>>    create mode 100755 scripts/oe-go-mod-autogen.py
>>>>>
>>>>> diff --git a/scripts/oe-go-mod-autogen.py b/scripts/oe-go-mod-autog=
en.py
>>>>> new file mode 100755
>>>>> index 00000000..09d6133b
>>>>> --- /dev/null
>>>>> +++ b/scripts/oe-go-mod-autogen.py
>>>>> @@ -0,0 +1,663 @@
>>>>> +#!/usr/bin/env python3
>>>>> +
>>>>> +import os
>>>>> +import sys
>>>>> +import logging
>>>>> +import argparse
>>>>> +from collections import OrderedDict
>>>>> +import subprocess
>>>>> +
>>>>> +# This switch is used to make this script error out ASAP, mainly f=
or debugging purpose
>>>>> +ERROR_OUT_ON_FETCH_AND_CHECKOUT_FAILURE =3D True
>>>>> +
>>>>> +logger =3D logging.getLogger('oe-go-mod-autogen')
>>>>> +loggerhandler =3D logging.StreamHandler()
>>>>> +loggerhandler.setFormatter(logging.Formatter("%(levelname)s: %(mes=
sage)s"))
>>>>> +logger.addHandler(loggerhandler)
>>>>> +logger.setLevel(logging.INFO)
>>>>> +
>>>>> +class GoModTool(object):
>>>>> +    def __init__(self, repo, rev, workdir):
>>>>> +        self.repo =3D repo
>>>>> +        self.rev =3D rev
>>>>> +        self.workdir =3D workdir
>>>>> +
>>>>> +        # Stores the actual module name and its related informatio=
n
>>>>> +        # {module: (repo_url, repo_dest_dir, fullsrcrev)}
>>>>> +        self.modules_repoinfo =3D {}
>>>>> +
>>>>> +        # {module_name: (url, version, destdir, fullsrcrev)}
>>>>> +        #
>>>>> +        # url: place to get the source codes, we only support git =
repo
>>>>> +        # version: module version, git tag or git rev
>>>>> +        # destdir: place to put the fetched source codes
>>>>> +        # fullsrcrev: full src rev which is the value of SRC_REV
>>>>> +        #
>>>>> +        # e.g.
>>>>> +        # For 'github.com/Masterminds/semver/v3 v3.1.1' in go.mod:
>>>>> +        # module_name =3D github.com/Masterminds/semver/v3
>>>>> +        # url =3D https://github.com/Masterminds/semver
>>>>> +        # version =3D v3.1.1
>>>>> +        # destdir =3D ${WORKDIR}/${BP}/src/${GO_IMPORT}/vendor/git=
hub.com/Masterminds/semver/v3
>>>>> +        # fullsrcrev =3D d387ce7889a157b19ad7694dba39a562051f41b0
>>>>> +        self.modules_require =3D OrderedDict()
>>>>> +
>>>>> +        # {orig_module: (actual_module, actual_version)}
>>>>> +        self.modules_replace =3D OrderedDict()
>>>>> +
>>>>> +        # Unhandled modules
>>>>> +        self.modules_unhandled =3D OrderedDict()
>>>>> +
>>>>> +        # store subpaths used to form srcpath
>>>>> +        # {actual_module_name: subpath}
>>>>> +        self.modules_subpaths =3D OrderedDict()
>>>>> +
>>>>> +        # modules's actual source paths, record those that are not=
 the same with the module itself
>>>>> +        self.modules_srcpaths =3D OrderedDict()
>>>>> +
>>>>> +        # store lines, comment removed
>>>>> +        self.require_lines =3D []
>>>>> +        self.replace_lines =3D []
>>>>> +
>>>>> +        # fetch repo
>>>>> +        self.fetch_and_checkout_repo(self.repo.split('://')[1], se=
lf.repo, self.rev, checkout=3DTrue, get_subpath=3DFalse)
>>>>> +
>>>>> +    def show_go_mod_info(self):
>>>>> +        # Print modules_require, modules_replace and modules_unhan=
dled
>>>>> +        print("modules required:")
>>>>> +        for m in self.modules_require:
>>>>> +            url, version, destdir, fullrev =3D self.modules_requir=
e[m]
>>>>> +            print("%s %s %s %s" % (m, version, url, fullrev))
>>>>> +
>>>>> +        print("modules replace:")
>>>>> +        for m in self.modules_replace:
>>>>> +            actual_module, actual_version =3D self.modules_replace=
[m]
>>>>> +            print("%s =3D> %s %s" % (m, actual_module, actual_vers=
ion))
>>>>> +
>>>>> +        print("modules unhandled:")
>>>>> +        for m in self.modules_unhandled:
>>>>> +            reason =3D self.modules_unhandled[m]
>>>>> +            print("%s unhandled: %s" % (m, reason))
>>>>> +
>>>>> +    def parse(self):
>>>>> +        # check if this repo needs autogen
>>>>> +        repo_url, repo_dest_dir, repo_fullrev =3D self.modules_rep=
oinfo[self.repo.split('://')[1]]
>>>>> +        if os.path.isdir(os.path.join(repo_dest_dir, 'vendor')):
>>>>> +            logger.info("vendor direcotry has already existed for =
%s, no need to add other repos" % self.repo)
>>>>> +            return
>>>>> +        go_mod_file =3D os.path.join(repo_dest_dir, 'go.mod')
>>>>> +        if not os.path.exists(go_mod_file):
>>>>> +            logger.info("go.mod file does not exist for %s, no nee=
d to add otehr repos" % self.repo)
>>>>> +            return
>>>>> +        self.parse_go_mod(go_mod_file)
>>>>> +        self.show_go_mod_info()
>>>>> +
>>>>> +    def fetch_and_checkout_repo(self, module_name, repo_url, rev, =
default_protocol=3D'https://', checkout=3DFalse, get_subpath=3DTrue):
>>>>> +        """
>>>>> +        Fetch repo_url to <workdir>/repos/repo_base_name
>>>>> +        """
>>>>> +        protocol =3D default_protocol
>>>>> +        if '://' in repo_url:
>>>>> +            repo_url_final =3D repo_url
>>>>> +        else:
>>>>> +            repo_url_final =3D default_protocol + repo_url
>>>>> +        logger.debug("fetch and checkout %s %s" % (repo_url_final,=
 rev))
>>>>> +        repos_dir =3D os.path.join(self.workdir, 'repos')
>>>>> +        if not os.path.exists(repos_dir):
>>>>> +            os.makedirs(repos_dir)
>>>>> +        repo_basename =3D repo_url.split('/')[-1].split('.git')[0]
>>>>> +        repo_dest_dir =3D os.path.join(repos_dir, repo_basename)
>>>>> +        module_last_name =3D module_name.split('/')[-1]
>>>>> +        git_action =3D "fetch"
>>>>> +        if os.path.exists(repo_dest_dir):
>>>>> +            if checkout:
>>>>> +                # check if current HEAD is rev
>>>>> +                try:
>>>>> +                    headrev =3D subprocess.check_output('git rev-l=
ist -1 HEAD', shell=3DTrue, cwd=3Drepo_dest_dir).decode('utf-8').strip()
>>>>> +                    requiredrev =3D subprocess.check_output('git r=
ev-list -1 %s 2>/dev/null || git rev-list -1 %s/%s' % (rev, module_last_n=
ame, rev), shell=3DTrue, cwd=3Drepo_dest_dir).decode('utf-8').strip()
>>>>> +                    if headrev =3D=3D requiredrev:
>>>>> +                        logger.info("%s has already been fetched a=
nd checked out as required, skipping" % repo_url)
>>>>> +                        self.modules_repoinfo[module_name] =3D (re=
po_url, repo_dest_dir, requiredrev)
>>>>> +                        return
>>>>> +                    else:
>>>>> +                        logger.info("HEAD of %s is not %s, will do=
 a clean clone" % (repo_dest_dir, requiredrev))
>>>>> +                        git_action =3D "clone"
>>>>> +                except:
>>>>> +                    logger.info("'git rev-list' in %s failed, will=
 do a clean clone" % repo_dest_dir)
>>>>> +                    git_action =3D "clone"
>>>>> +            else:
>>>>> +                # determine if the current repo points to the desi=
red remote repo
>>>>> +                try:
>>>>> +                    remote_origin_url =3D subprocess.check_output(=
'git config --get remote.origin.url', shell=3DTrue, cwd=3Drepo_dest_dir).=
decode('utf-8').strip()
>>>>> +                    if remote_origin_url.endswith('.git'):
>>>>> +                        if not repo_url_final.endswith('.git'):
>>>>> +                            remote_origin_url =3D remote_origin_ur=
l[:-4]
>>>>> +                    else:
>>>>> +                        if repo_url_final.endswith('.git'):
>>>>> +                            remote_origin_url =3D remote_origin_ur=
l + '.git'
>>>>> +                    if remote_origin_url !=3D repo_url_final:
>>>>> +                        logger.info("remote.origin.url for %s is n=
ot %s, will do a clean clone" % (repo_dest_dir, repo_url_final))
>>>>> +                        git_action =3D "clone"
>>>>> +                except:
>>>>> +                    logger.info("'git config --get remote.origin.u=
rl' in %s failed, will do a clean clone" % repo_dest_dir)
>>>>> +                    git_action =3D "clone"
>>>>> +        else:
>>>>> +            # No local repo, clone it.
>>>>> +            git_action =3D "clone"
>>>>> +
>>>>> +        if git_action =3D=3D "clone":
>>>>> +            logger.info("Removing %s" % repo_dest_dir)
>>>>> +            subprocess.check_call('rm -rf %s' % repo_dest_dir, she=
ll=3DTrue)
>>>>> +
>>>>> +        # clone/fetch repo
>>>>> +        try:
>>>>> +            git_cwd =3D repos_dir if git_action =3D=3D "clone" els=
e repo_dest_dir
>>>>> +            logger.info("git %s %s in %s" % (git_action, repo_url_=
final, git_cwd))
>>>>> +            subprocess.check_call('git %s %s >/dev/null 2>&1' % (g=
it_action, repo_url_final), shell=3DTrue, cwd=3Dgit_cwd)
>>>>> +        except:
>>>>> +            logger.warning("Failed to %s %s in %s" % (git_action, =
repo_url_final, git_cwd))
>>>>> +            return
>>>>> +
>>>>> +        def get_requiredrev(get_subpath):
>>>>> +            import re
>>>>> +            # check if rev is a revision or a version
>>>>> +            if len(rev) =3D=3D 12 and re.match('[0-9a-f]+', rev):
>>>>> +                rev_is_version =3D False
>>>>> +            else:
>>>>> +                rev_is_version =3D True
>>>>> +
>>>>> +            # if rev is not a version, 'git rev-list -1 <rev>' sho=
uld just succeed!
>>>>> +            if not rev_is_version:
>>>>> +                try:
>>>>> +                    rev_return =3D subprocess.check_output('git re=
v-list -1 %s 2>/dev/null' % rev, shell=3DTrue, cwd=3Drepo_dest_dir).decod=
e('utf-8').strip()
>>>>> +                    if get_subpath:
>>>>> +                        cmd =3D 'git branch -M toremove && git che=
ckout -b check_subpath %s && git branch -D toremove' % rev_return
>>>>> +                        subprocess.check_call(cmd, shell=3DTrue, c=
wd=3Drepo_dest_dir)
>>>>> +                        # try to get the subpath for this module
>>>>> +                        module_name_parts =3D module_name.split('/=
')
>>>>> +                        while (len(module_name_parts) > 0):
>>>>> +                            subpath =3D '/'.join(module_name_parts=
)
>>>>> +                            dir_to_check =3D repo_dest_dir + '/' +=
 '/'.join(module_name_parts)
>>>>> +                            if os.path.isdir(dir_to_check):
>>>>> +                                self.modules_subpaths[module_name]=
 =3D subpath
>>>>> +                                break
>>>>> +                            else:
>>>>> +                                module_name_parts.pop(0)
>>>>> +                    return rev_return
>>>>> +                except:
>>>>> +                    logger.warning("Revision (%s) not in repo(%s)"=
 % (rev, repo_dest_dir))
>>>>> +                    return None
>>>>> +
>>>>> +            # the following codes deals with case where rev is a v=
ersion
>>>>> +            # determine the longest match tag, in this way, we can=
 get the current srcpath to be used in relocation.inc
>>>>> +            # we first get the initial tag, which is formed from m=
odule_name and rev
>>>>> +            module_parts =3D module_name.split('/')
>>>>> +            if rev.startswith(module_parts[-1] + '.'):
>>>>> +                tag =3D '/'.join(module_parts[:-1]) + '/' + rev
>>>>> +                last_module_part_replaced =3D True
>>>>> +            else:
>>>>> +                tag =3D '/'.join(module_parts) + '/' + rev
>>>>> +                last_module_part_replaced =3D False
>>>>> +            logger.debug("use %s as the initial tag for %s" % (tag=
, module_name))
>>>>> +            tag_parts =3D tag.split('/')
>>>>> +            while(len(tag_parts) > 0):
>>>>> +                try:
>>>>> +                    rev_return =3D subprocess.check_output('git re=
v-list -1 %s 2>/dev/null' % tag, shell=3DTrue, cwd=3Drepo_dest_dir).decod=
e('utf-8').strip()
>>>>> +                    if len(tag_parts) > 1:
>>>>> +                        # ensure that the subpath exists
>>>>> +                        if get_subpath:
>>>>> +                            cmd =3D 'git branch -M toremove && git=
 checkout -b check_subpath %s && git branch -D toremove' % rev_return
>>>>> +                            subprocess.check_call(cmd, shell=3DTru=
e, cwd=3Drepo_dest_dir)
>>>>> +                            # get subpath for the actual_module_na=
me
>>>>> +                            if last_module_part_replaced:
>>>>> +                                subpath =3D '/'.join(tag_parts[:-1=
]) + '/' + module_parts[-1]
>>>>> +                                if not os.path.isdir(repo_dest_dir=
 + '/' + subpath):
>>>>> +                                    subpath =3D '/'.join(tag_parts=
[:-1])
>>>>> +                            else:
>>>>> +                                subpath =3D '/'.join(tag_parts[:-1=
])
>>>>> +                            if not os.path.isdir(repo_dest_dir + '=
/' + subpath):
>>>>> +                                logger.warning("subpath (%s) deriv=
ed from tag matching does not exist in %s" % (subpath, repo_dest_dir))
>>>>> +                                return None
>>>>> +                            self.modules_subpaths[module_name] =3D=
 subpath
>>>>> +                            logger.info("modules_subpath[%s] =3D %=
s" % (module_name, subpath))
>>>>> +                    return rev_return
>>>>> +                except:
>>>>> +                    tag_parts.pop(0)
>>>>> +                    tag =3D '/'.join(tag_parts)
>>>>> +            logger.warning("No tag matching %s" % rev)
>>>>> +            return None
>>>>> +
>>>>> +        requiredrev =3D get_requiredrev(get_subpath)
>>>>> +        if requiredrev:
>>>>> +            logger.info("Got module(%s) requiredrev: %s" % (module=
_name, requiredrev))
>>>>> +            if checkout:
>>>>> +                subprocess.check_call('git checkout -b gomodautoge=
n %s' % requiredrev, shell=3DTrue, cwd=3Drepo_dest_dir)
>>>>> +            self.modules_repoinfo[module_name] =3D (repo_url, repo=
_dest_dir, requiredrev)
>>>>> +        else:
>>>>> +            logger.warning("Failed to get requiredrev, repo_url =3D=
 %s, rev =3D %s, module_name =3D %s" % (repo_url, rev, module_name))
>>>>> +
>>>>> +    def parse_go_mod(self, go_mod_path):
>>>>> +        """
>>>>> +        Parse go.mod file to get the modules info
>>>>> +        """
>>>>> +        # First we get the require and replace lines
>>>>> +        # The parsing logic assumes the replace lines come *after*=
 the require lines
>>>>> +        inrequire =3D False
>>>>> +        inreplace =3D False
>>>>> +        with open(go_mod_path, 'r') as f:
>>>>> +            lines =3D f.readlines()
>>>>> +            for line in lines:
>>>>> +                if line.startswith('require ('):
>>>>> +                    inrequire =3D True
>>>>> +                    continue
>>>>> +                if line.startswith(')'):
>>>>> +                    inrequire =3D False
>>>>> +                    continue
>>>>> +                if line.startswith('require ') or inrequire:
>>>>> +                    # we have one line require
>>>>> +                    require_line =3D line.lstrip('require ').split=
('//')[0].strip()
>>>>> +                    if require_line:
>>>>> +                        self.require_lines.append(require_line)
>>>>> +                    continue
>>>>> +                # we can deal with requires and replaces separatel=
y because go.mod always writes requires before replaces
>>>>> +                if line.startswith('replace ('):
>>>>> +                    inreplace =3D True
>>>>> +                    continue
>>>>> +                if line.startswith(')'):
>>>>> +                    inreplace =3D False
>>>>> +                    continue
>>>>> +                if line.startswith('replace ') or inreplace:
>>>>> +                    replace_line =3D line.lstrip('replace ').split=
('//')[0].strip()
>>>>> +                    if replace_line:
>>>>> +                        self.replace_lines.append(replace_line)
>>>>> +                    continue
>>>>> +        #
>>>>> +        # parse the require_lines and replace_lines to form self.m=
odules_require and self.modules_replace
>>>>> +        #
>>>>> +        logger.debug("Parsing require_lines and replace_lines ..."=
)
>>>>> +        # A typical replace line is as below:
>>>>> +        #   github.com/hashicorp/golang-lru =3D> github.com/ktock/=
golang-lru v0.5.5-0.20211029085301-ec551be6f75c
>>>>> +        # It means that the github.com/hashicorp/golang-lru module=
 is replaced by github.com/ktock/golang-lru
>>>>> +        # with the version 'v0.5.5-0.20211029085301-ec551be6f75c'.
>>>>> +        # So the destdir is vendor/github.com/hashicorp/golang-lru=
 while the contents are from github.com/ktock/golang-lru
>>>>> +        for line in self.replace_lines:
>>>>> +            orig_module, actual =3D line.split('=3D>')
>>>>> +            actual_module, actual_version =3D actual.split()
>>>>> +            orig_module =3D orig_module.strip()
>>>>> +            actual_module =3D actual_module.strip()
>>>>> +            actual_version =3D actual_version.strip()
>>>>> +            self.modules_replace[orig_module] =3D (actual_module, =
actual_version)
>>>>> +        #
>>>>> +        # Typical require lines are as below:
>>>>> +        #   github.com/Masterminds/semver/v3 v3.1.1
>>>>> +        #   golang.org/x/crypto v0.0.0-20220321153916-2c7772ba3064
>>>>> +        #
>>>>> +        # We need to first try https://<module_name>?=3Dgo-get=3D1=
 to see it contains
>>>>> +        # line starting with '<meta name=3D"go-import" content=3D'.
>>>>> +        #
>>>>> +        # If so, get root-path vcs repo-url from content. See http=
s://go.dev/ref/mod#vcs-find
>>>>> +        # For example, the above 'wget https://golang.org/x/crypto=
?go-get=3D1' gives you
>>>>> +        # <meta name=3D"go-import" content=3D"golang.org/x/crypto =
git https://go.googlesource.com/crypto">
>>>>> +        # In such case, the self.modules_require has the following=
 contents:
>>>>> +        # module_name: golang.org/x/crypto
>>>>> +        # url: https://go.googlesource.com/crypto
>>>>> +        # version: v0.0.0-20220321153916-2c7772ba3064
>>>>> +        # destdir: ${WORKDIR}/${BP}/src/import/vendor.fetch/golang=
.org/x/crypto
>>>>> +        # fullsrcrev: 2c7772ba30643b7a2026cbea938420dce7c6384d (gi=
t rev-list -1 2c7772ba3064)
>>>>> +        #
>>>>> +        # If not, try https://pkg.go.dev/<module_name>, and find t=
he 'Repository'.
>>>>> +        # For example, 'wget https://pkg.go.dev/github.com/Masterm=
inds/semver/v3' gives:
>>>>> +        # github.com/Masterminds/semver
>>>>> +        # In such case, the self.modules has the following content=
s:
>>>>> +        # module_name: github.com/Masterminds/semver/v3
>>>>> +        # url: https://github.com/Masterminds/semver
>>>>> +        # version: v3.1.1
>>>>> +        # destdir: ${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/Masterminds/semver/v3
>>>>> +        # fullsrcrev: 7bb0c843b53d6ad21a3f619cb22c4b442bb3ef3e (gi=
t rev-list -1 v3.1.1)
>>>>> +        #
>>>>> +        # As a last resort, if the last component of <module_name>=
 matches 'v[0-9]+',
>>>>> +        # remove the last component and try wget https://<module_n=
ame_with_last_component_removed>?go-get=3D1,
>>>>> +        # then try using the above matching method.
>>>>> +        #
>>>>> +        for line in self.require_lines:
>>>>> +            module_name, version =3D line.strip().split()
>>>>> +            logger.debug("require line: %s" % line)
>>>>> +            logger.debug("module_name =3D %s; version =3D %s" % (m=
odule_name, version))
>>>>> +            # take the modules_replace into consideration to get t=
he actual version and actual module name
>>>>> +            # note that the module_name is used in destdir, and th=
e actual_module_name and actual_version
>>>>> +            # are used to determine the url and fullsrcrev
>>>>> +            destdir =3D '${WORKDIR}/${BP}/src/import/vendor.fetch/=
%s' % module_name
>>>>> +            actual_module_name =3D module_name
>>>>> +            actual_version =3D version
>>>>> +            if module_name in self.modules_replace:
>>>>> +                actual_module_name, actual_version =3D self.module=
s_replace[module_name]
>>>>> +            logger.debug("actual_module_name =3D %s; actual_versio=
n =3D %s" % (actual_module_name, actual_version))
>>>>> +            url, fullsrcrev =3D self.get_url_srcrev(actual_module_=
name, actual_version)
>>>>> +            logger.debug("url =3D %s; fullsrcrev =3D %s" % (url, f=
ullsrcrev))
>>>>> +            if url and fullsrcrev:
>>>>> +                self.modules_require[module_name] =3D (url, versio=
n, destdir, fullsrcrev)
>>>>> +                # form srcpath, actual_module_name/<subpath>
>>>>> +                if actual_module_name in self.modules_subpaths:
>>>>> +                    subpath =3D self.modules_subpaths[actual_modul=
e_name]
>>>>> +                    srcpath =3D '%s/%s' % (actual_module_name, sub=
path)
>>>>> +                    self.modules_srcpaths[module_name] =3D srcpath
>>>>> +                    logger.info("self.modules_srcpaths[%s] =3D %s"=
 % (module_name, srcpath))
>>>>> +                else:
>>>>> +                    self.modules_srcpaths[module_name] =3D actual_=
module_name
>>>>> +            else:
>>>>> +                logger.warning("get_url_srcrev(%s, %s) failed" % (=
actual_module_name, actual_version))
>>>>> +                if ERROR_OUT_ON_FETCH_AND_CHECKOUT_FAILURE:
>>>>> +                    sys.exit(1)
>>>>> +
>>>>> +    def use_wget_to_get_repo_url(self, wget_content_file, url_cach=
e_file, module_name):
>>>>> +        """
>>>>> +        Use wget to get repo_url for module_name, return None if n=
ot found
>>>>> +        """
>>>>> +        try:
>>>>> +            logger.info("wget -O %s https://%s?=3Dgo-get=3D1" % (w=
get_content_file, module_name))
>>>>> +            subprocess.check_call('wget -O %s https://%s?=3Dgo-get=
=3D1' % (wget_content_file, module_name), shell=3DTrue)
>>>>> +            with open(wget_content_file, 'r') as f:
>>>>> +                for line in f.readlines():
>>>>> +                    if '<meta name=3D"go-import" content=3D' in li=
ne:
>>>>> +                        logger.info("Succeed to find go-import con=
tent for %s" % module_name)
>>>>> +                        logger.debug("The line is %s" % line)
>>>>> +                        root_path, vcs, repo_url =3D line.split('c=
ontent=3D')[1].split('"')[1].split()
>>>>> +                        logger.info("%s: %s %s %s" % (module_name,=
 root_path, vcs, repo_url))
>>>>> +                        if vcs !=3D 'git':
>>>>> +                            logger.warning('%s unhandled as its vc=
s is %s which is not supported by this script.' % (module_name, vcs))
>>>>> +                            unhandled_reason =3D 'vcs %s is not su=
pported by this script' % vcs
>>>>> +                            self.modules_unhandled[module_name] =3D=
 unhandled_reason
>>>>> +                            return None
>>>>> +                        with open(url_cache_file, 'w') as f:
>>>>> +                            f.write(repo_url)
>>>>> +                        return repo_url
>>>>> +        except:
>>>>> +            logger.info("wget -O %s https://%s?=3Dgo-get=3D1 faile=
d" % (wget_content_file, module_name))
>>>>> +        # if we cannot find repo url from https://<module_name>?=3D=
go-get=3D1, try https://pkg.go/dev/<module_name>
>>>>> +        try:
>>>>> +            logger.info("wget -O %s https://pkg.go.dev/%s" % (wget=
_content_file, module_name))
>>>>> +            subprocess.check_call("wget -O %s https://pkg.go.dev/%=
s" % (wget_content_file, module_name), shell=3DTrue)
>>>>> +            repo_url_found =3D False
>>>>> +            with open(wget_content_file, 'r') as f:
>>>>> +                in_repo_section =3D False
>>>>> +                for line in f.readlines():
>>>>> +                    if '>Repository<' in line:
>>>>> +                        in_repo_section =3D True
>>>>> +                        continue
>>>>> +                    if in_repo_section:
>>>>> +                        newline =3D line.strip()
>>>>> +                        if newline !=3D '' and not newline.startsw=
ith('<'):
>>>>> +                            repo_url =3D newline
>>>>> +                            repo_url_found =3D True
>>>>> +                            break
>>>>> +            if repo_url_found:
>>>>> +                logger.info("repo url for %s: %s" % (module_name, =
repo_url))
>>>>> +                with open(url_cache_file, 'w') as f:
>>>>> +                    f.write(repo_url)
>>>>> +                return repo_url
>>>>> +            else:
>>>>> +                unhandled_reason =3D 'cannot determine repo_url fo=
r %s' % module_name
>>>>> +                self.modules_unhandled[module_name] =3D unhandled_=
reason
>>>>> +                return None
>>>>> +        except:
>>>>> +            logger.info("wget -O %s https://pkg.go.dev/%s failed" =
% (wget_content_file, module_name))
>>>>> +            return None
>>>>> +
>>>>> +
>>>>> +    def get_repo_url_rev(self, module_name, version):
>>>>> +        """
>>>>> +        Return (repo_url, rev)
>>>>> +        """
>>>>> +        import re
>>>>> +        # First get rev from version
>>>>> +        v =3D version.split('+incompatible')[0]
>>>>> +        version_components =3D v.split('-')
>>>>> +        if len(version_components) =3D=3D 1:
>>>>> +            rev =3D v
>>>>> +        elif len(version_components) =3D=3D 3:
>>>>> +            if len(version_components[2]) =3D=3D 12:
>>>>> +                rev =3D version_components[2]
>>>>> +            else:
>>>>> +                rev =3D v
>>>>> +        else:
>>>>> +            rev =3D v
>>>>> +
>>>>> +        #
>>>>> +        # Get repo_url
>>>>> +        # We put a cache mechanism here, <wget_content_file>.repo_=
url.cache is used to store the repo url fetch before
>>>>> +        #
>>>>> +        wget_dir =3D os.path.join(self.workdir, 'wget-contents')
>>>>> +        if not os.path.exists(wget_dir):
>>>>> +            os.makedirs(wget_dir)
>>>>> +        wget_content_file =3D os.path.join(wget_dir, module_name.r=
eplace('/', '_'))
>>>>> +        url_cache_file =3D "%s.repo_url.cache" % wget_content_file
>>>>> +        if os.path.exists(url_cache_file):
>>>>> +            with open(url_cache_file, 'r') as f:
>>>>> +                repo_url =3D f.readline().strip()
>>>>> +                return (repo_url, rev)
>>>>> +        module_name_parts =3D module_name.split('/')
>>>>> +        while (len(module_name_parts) > 0):
>>>>> +            module_name_to_check =3D '/'.join(module_name_parts)
>>>>> +            logger.info("module_name_to_check: %s" % module_name_t=
o_check)
>>>>> +            repo_url =3D self.use_wget_to_get_repo_url(wget_conten=
t_file, url_cache_file, module_name_to_check)
>>>>> +            if repo_url:
>>>>> +                return (repo_url, rev)
>>>>> +            else:
>>>>> +                if module_name in self.modules_unhandled:
>>>>> +                    return (None, rev)
>>>>> +                else:
>>>>> +                    module_name_parts.pop(-1)
>>>>> +
>>>>> +        unhandled_reason =3D 'cannot determine the repo for %s' % =
module_name
>>>>> +        self.modules_unhandled[module_name] =3D unhandled_reason
>>>>> +        return (None, rev)
>>>>> +
>>>>> +    def get_url_srcrev(self, module_name, version):
>>>>> +        """
>>>>> +        Return url and fullsrcrev according to module_name and ver=
sion
>>>>> +        """
>>>>> +        repo_url, rev =3D self.get_repo_url_rev(module_name, versi=
on)
>>>>> +        if not repo_url or not rev:
>>>>> +            return (None, None)
>>>>> +        self.fetch_and_checkout_repo(module_name, repo_url, rev)
>>>>> +        if module_name in self.modules_repoinfo:
>>>>> +            repo_url, repo_dest_dir, repo_fullrev =3D self.modules=
_repoinfo[module_name]
>>>>> +            # remove the .git suffix to sync repos across modules =
with different versions and across recipes
>>>>> +            if repo_url.endswith('.git'):
>>>>> +                repo_url =3D repo_url[:-len('.git')]
>>>>> +            return (repo_url, repo_fullrev)
>>>>> +        else:
>>>>> +            unhandled_reason =3D 'fetch_and_checkout_repo(%s, %s, =
%s) failed' % (module_name, repo_url, rev)
>>>>> +            self.modules_unhandled[module_name] =3D unhandled_reas=
on
>>>>> +            return (None, None)
>>>>> +
>>>>> +    def gen_src_uri_inc(self):
>>>>> +        """
>>>>> +        Generate src_uri.inc file containing SRC_URIs
>>>>> +        """
>>>>> +        src_uri_inc_file =3D os.path.join(self.workdir, 'src_uri.i=
nc')
>>>>> +        # record the <name> after writting SRCREV_<name>, this is =
to avoid modules having the same basename resulting in same SRCREV_xxx
>>>>> +        srcrev_name_recorded =3D []
>>>>> +        template =3D """#       %s %s
>>>>> +# [1] git ls-remote %s %s
>>>>> +SRCREV_%s=3D"%s"
>>>>> +SRC_URI +=3D "git://%s;name=3D%s;protocol=3Dhttps;nobranch=3D1;des=
tsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/%s"
>>>>> +
>>>>> +"""
>>>>> +        # We can't simply write SRC_URIs one by one in the order t=
hat go.mod specify them.
>>>>> +        # Because the latter one might clean things up for the for=
mer one if the former one is a subpath of the latter one.
>>>>> +        def take_first_len(elem):
>>>>> +            return len(elem[0])
>>>>> +
>>>>> +        src_uri_contents =3D []
>>>>> +        with open(src_uri_inc_file, 'w') as f:
>>>>> +            for module in self.modules_require:
>>>>> +                # {module_name: (url, version, destdir, fullsrcrev=
)}
>>>>> +                repo_url, version, destdir, fullrev =3D self.modul=
es_require[module]
>>>>> +                if module in self.modules_replace:
>>>>> +                    actual_module_name, actual_version =3D self.mo=
dules_replace[module]
>>>>> +                else:
>>>>> +                    actual_module_name, actual_version =3D (module=
, version)
>>>>> +                if '://' in repo_url:
>>>>> +                    repo_url_noprotocol =3D repo_url.split('://')[=
1]
>>>>> +                else:
>>>>> +                    repo_url_noprotocol =3D repo_url
>>>>> +                if not repo_url.startswith('https://'):
>>>>> +                    repo_url =3D 'https://' + repo_url
>>>>> +                name =3D module.split('/')[-1]
>>>>> +                if name in srcrev_name_recorded:
>>>>> +                    name =3D '-'.join(module.split('/')[-2:])
>>>>> +                src_uri_contents.append((actual_module_name, actua=
l_version, repo_url, fullrev, name, fullrev, repo_url_noprotocol, name, a=
ctual_module_name))
>>>>> +                srcrev_name_recorded.append(name)
>>>>> +            # sort the src_uri_contents and then write it
>>>>> +            src_uri_contents.sort(key=3Dtake_first_len)
>>>>> +            for content in src_uri_contents:
>>>>> +                f.write(template % content)
>>>>> +        logger.info("%s generated" % src_uri_inc_file)
>>>>> +
>>>>> +    def gen_relocation_inc(self):
>>>>> +        """
>>>>> +        Generate relocation.inc file
>>>>> +        """
>>>>> +        relocation_inc_file =3D os.path.join(self.workdir, 'reloca=
tion.inc')
>>>>> +        template =3D """export sites=3D"%s"
>>>>> +
>>>>> +do_compile:prepend() {
>>>>> +    cd ${S}/src/import
>>>>> +    for s in $sites; do
>>>>> +        site_dest=3D$(echo $s | cut -d: -f1)
>>>>> +        site_source=3D$(echo $s | cut -d: -f2)
>>>>> +        force_flag=3D$(echo $s | cut -d: -f3)
>>>>> +        mkdir -p vendor.copy/$site_dest
>>>>> +        if [ -n "$force_flag" ]; then
>>>>> +           echo "[INFO] $site_dest: force copying .go files"
>>>>> +           rm -rf vendor.copy/$site_dest
>>>>> +           rsync -a --exclude=3D'vendor/' --exclude=3D'.git/' vend=
or.fetch/$site_source/ vendor.copy/$site_dest
>>>>> +        else
>>>>> +            [ -n "$(ls -A vendor.copy/$site_dest/*.go 2> /dev/null=
)" ] && { echo "[INFO] vendor.fetch/$site_source -> $site_dest: go copy s=
kipped (files present)" ; true ; } || { echo "[INFO] $site_dest: copying =
.go files" ; rsync -a --exclude=3D'vendor/' --exclude=3D'.git/' vendor.fe=
tch/$site_source/ vendor.copy/$site_dest ; }
>>>>> +        fi
>>>>> +    done
>>>>> +}
>>>>> +"""
>>>>> +        sites =3D []
>>>>> +        for module in self.modules_require:
>>>>> +            # <dest>:<source>[:force]
>>>>> +            if module in self.modules_srcpaths:
>>>>> +                srcpath =3D self.modules_srcpaths[module]
>>>>> +                logger.debug("Using %s as srcpath of module (%s)" =
% (srcpath, module))
>>>>> +            else:
>>>>> +                srcpath =3D module
>>>>> +            sites.append("%s:%s:force" % (module, srcpath))
>>>>> +        # To avoid the former one being overriden by the latter on=
e when the former one is a subpath of the latter one, sort sites
>>>>> +        sites.sort(key=3Dlen)
>>>>> +        with open(relocation_inc_file, 'w') as f:
>>>>> +            sites_str =3D ' \\\n           '.join(sites)
>>>>> +            f.write(template % sites_str)
>>>>> +        logger.info("%s generated" % relocation_inc_file)
>>>>> +
>>>>> +    def gen_modules_txt(self):
>>>>> +        """
>>>>> +        Generate modules.txt file
>>>>> +        """
>>>>> +        modules_txt_file =3D os.path.join(self.workdir, 'modules.t=
xt')
>>>>> +        with open(modules_txt_file, 'w') as f:
>>>>> +            for l in self.require_lines:
>>>>> +                f.write('# %s\n' % l)
>>>>> +                f.write('## explicit\n')
>>>>> +            for l in self.replace_lines:
>>>>> +                f.write('# %s\n' %l)
>>>>> +        logger.info("%s generated" % modules_txt_file)
>>>>> +
>>>>> +    def sanity_check(self):
>>>>> +        """
>>>>> +        Various anity checks
>>>>> +        """
>>>>> +        sanity_check_ok =3D True
>>>>> +        #
>>>>> +        # Sanity Check 1:
>>>>> +        #     For modules having the same repo, at most one is all=
owed to not have subpath.
>>>>> +        #     This check operates on self.modules_repoinfo and sel=
f.modules_subpaths
>>>>> +        #
>>>>> +        repo_modules =3D {}
>>>>> +        for module in self.modules_repoinfo:
>>>>> +            # first form {repo: [module1, module2, ...]}
>>>>> +            repo_url, repo_dest_dir, fullsrcrev =3D self.modules_r=
epoinfo[module]
>>>>> +            if repo_url not in repo_modules:
>>>>> +                repo_modules[repo_url] =3D [module]
>>>>> +            else:
>>>>> +                repo_modules[repo_url].append(module)
>>>>> +        for repo in repo_modules:
>>>>> +            modules =3D repo_modules[repo]
>>>>> +            if len(modules) =3D=3D 1:
>>>>> +                continue
>>>>> +            # for modules sharing the same repo, at most one is al=
lowed to not have subpath
>>>>> +            nosubpath_modules =3D []
>>>>> +            for m in modules:
>>>>> +                if m not in self.modules_subpaths:
>>>>> +                    nosubpath_modules.append(m)
>>>>> +            if len(nosubpath_modules) =3D=3D 0:
>>>>> +                continue
>>>>> +            if len(nosubpath_modules) > 1:
>>>>> +                logger.warning("Multiple modules sharing %s, but t=
hey don't have subpath: %s. Please double check." % (repo, nosubpath_modu=
les))
>>>>> +            if len(nosubpath_modules) =3D=3D 1:
>>>>> +                # do further check, OK if the module is the prefix=
 for other modules sharing the same repo
>>>>> +                module_to_check =3D nosubpath_modules[0]
>>>>> +                for m in modules:
>>>>> +                    if module_to_check =3D=3D m:
>>>>> +                        continue
>>>>> +                    if not m.startswith('%s/' % module_to_check):
>>>>> +                        logger.warning("%s is sharing repo (%s) wi=
th other modules, and it might need a subpath. Please double check" % (mo=
dule_to_check, repo))
>>>>> +                        continue
>>>>> +
>>>>> +        #
>>>>> +        # End of Sanity Check
>>>>> +        #
>>>>> +        if not sanity_check_ok:
>>>>> +            sys.exit(1)
>>>>> +        return
>>>>> +
>>>>> +def main():
>>>>> +    parser =3D argparse.ArgumentParser(
>>>>> +        description=3D"oe-go-mod-autogen.py is used to generate sr=
c_uri.inc, relocation.inc and modules.txt to be used by go mod recipes",
>>>>> +        epilog=3D"Use %(prog)s --help to get help")
>>>>> +    parser.add_argument("--repo", help =3D "Repo for the recipe.",=
 required=3DTrue)
>>>>> +    parser.add_argument("--rev", help =3D "Revision for the recipe=
.", required=3DTrue)
>>>>> +    parser.add_argument("--module", help =3D "Go module name. To b=
e used with '--test'")
>>>>> +    parser.add_argument("--version", help =3D "Go module version. =
To be used with '--test'")
>>>>> +    parser.add_argument("--test", help =3D "Test to get repo url a=
nd fullsrcrev, used together with --module and --version.", action=3D"sto=
re_true")
>>>>> +    parser.add_argument("--workdir", help =3D "Working directory t=
o hold intermediate results and output.", default=3Dos.getcwd())
>>>>> +    parser.add_argument("-d", "--debug",
>>>>> +                        help =3D "Enable debug output",
>>>>> +                        action=3D"store_const", const=3Dlogging.DE=
BUG, dest=3D"loglevel", default=3Dlogging.INFO)
>>>>> +    parser.add_argument("-q", "--quiet",
>>>>> +                        help =3D "Hide all output except error mes=
sages",
>>>>> +                        action=3D"store_const", const=3Dlogging.ER=
ROR, dest=3D"loglevel")
>>>>> +    args =3D parser.parse_args()
>>>>> +
>>>>> +    logger.setLevel(args.loglevel)
>>>>> +    logger.debug("oe-go-mod-autogen.py running for %s:%s in %s" % =
(args.repo, args.rev, args.workdir))
>>>>> +    gomodtool =3D GoModTool(args.repo, args.rev, args.workdir)
>>>>> +    if args.test:
>>>>> +        if not args.module or not args.version:
>>>>> +            print("Please specify --module and --version")
>>>>> +            sys.exit(1)
>>>>> +        url, srcrev =3D gomodtool.get_url_srcrev(args.module, args=
.version)
>>>>> +        print("url =3D %s, srcrev =3D %s" % (url, srcrev))
>>>>> +        if not url or not srcrev:
>>>>> +            print("Failed to get url & srcrev for %s:%s" % (args.m=
odule, args.version))
>>>>> +    else:
>>>>> +        gomodtool.parse()
>>>>> +        gomodtool.sanity_check()
>>>>> +        gomodtool.gen_src_uri_inc()
>>>>> +        gomodtool.gen_relocation_inc()
>>>>> +        gomodtool.gen_modules_txt()
>>>>> +
>>>>> +
>>>>> +if __name__ =3D=3D "__main__":
>>>>> +    try:
>>>>> +        ret =3D main()
>>>>> +    except Exception as esc:
>>>>> +        ret =3D 1
>>>>> +        import traceback
>>>>> +        traceback.print_exc()
>>>>> +    sys.exit(ret)
>>>>> --
>>>>> 2.40.0
>>>>>
>>>>>
>>>>>
>>>>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#8279): https://lists.yoctoproject.org/g/meta-virtu=
alization/message/8279
>> Mute This Topic: https://lists.yoctoproject.org/mt/101162746/1050810
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/leav=
e/6693017/1050810/978058475/xyzzy [bruce.ashfield@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>


