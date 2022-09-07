Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BB2FC54EE9
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 14:34:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.8477.1662561253484709786
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Sep 2022 07:34:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=fVNKVWlZ;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=62493dea70=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 287BTtIS014903;
	Wed, 7 Sep 2022 07:34:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=YnZwUiFgcWfzHxAjZEWwoCGZA4KdlvIgoJXT9QtHjqw=;
 b=fVNKVWlZnRkHYaAQ9moUOz48kfLtrxxrUl9HOX/cx6gICLJkGNA7UVGat4xs9N0khI74
 6kVaX0K60tSVYjTgIPjRrDEBQtn5CfvPU2S9XGCZl6b4XjphvrSxEWR1WGFyRbXR56qy
 nuL8vDVFgJlrCDfTzEtlI7qTaFWSsTBT2I2EJrgqyXx+r23QB2GfluoV4ZNckmVp8Htk
 yLKu3yCCL2OXKJsipB6cv9Bg6L1OdxQZnNmZu/pkRI4x542KFnQwyUdNn9njzRSE5xOZ
 bfK797/HvpeKAXAlqgDzTYjjUje75CWii6aLeAa1rX7j0BWV/FG7v8pous6qD7h3KUsD Rw==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jeh32gn2y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Sep 2022 07:34:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=doJOancLSoc5umgr6edvYHHYLmpQT1/m9gVPI79IkW5X8zELPraIK8GUBkHKh7c+69ocKrnvyAnjjk7DCs8+dL8+nBr4XHRktRr4WkdcLB3isOYBxrwcjppEJhNLHheVRd/FZ8cWXcYWY5cb506dqBthsxIktMrfSurHHnxNT2Ancd+WCtYKnZcOPav/zAoNYE9BRdYqyJoICKWvrSI0SmmwqdDYJx1igACYHqJyLU/SoWwUs5akdx9SsbNu9Bgn69/0/j/2L65im/M6r9kug/kcIAphmfBh/t/PGOl32WVSpz9uXlCxV0XhM/mHi5ANSMacvo7XDeyaJOt71z6Hsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YnZwUiFgcWfzHxAjZEWwoCGZA4KdlvIgoJXT9QtHjqw=;
 b=DCDFlfZkZ3YtDHtZPxQsaiibhFdya9GuWP/K1piKOEkQvyXrcdQlA5dXnFz1v3xPuMSdyxh46V5i3vOVdxuhn+DK3LsxoKKqAsFQypA75tEH5I2R7vB2g8frpp33A7CISmXvmhBXiJiRYIv6/3StbCM5Q1Na8WMmcozmTL5D/8jqvTZ3tck9VNmdiFfy+gjgR45+jPZ4bnfmeFRlf46qr9+K9ZJdeFLSFG3pxuuYNtv4PtTK4H/sZ2X/CXu47W5DEkdREXQr8KeR36KQlbvLEo9s7GhMFEVbdfFKM4LNBRM2oDmffVxNDs/Ilst0Qj2hFD5a9CC6dsV78T+Ywp89lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM8PR11MB5701.namprd11.prod.outlook.com (2603:10b6:8:20::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.11; Wed, 7 Sep 2022 14:34:09 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3526:31b1:a7c:cd2]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3526:31b1:a7c:cd2%5]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 14:34:09 +0000
Message-ID: <a3eb7fca-8c94-3663-a36f-19128d739a55@windriver.com>
Date: Wed, 7 Sep 2022 10:34:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [meta-virtualization][PATCH] ceph: fix CVE-2022-0670
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20220906220710.38267-1-sakib.sajal@windriver.com>
 <CADkTA4PVgTCL0GrjFmy15kzMAqEwNkjdHF_Spq1Ho9q_ZdFcAA@mail.gmail.com>
From: Sakib Sajal <sakib.sajal@windriver.com>
In-Reply-To: 
 <CADkTA4PVgTCL0GrjFmy15kzMAqEwNkjdHF_Spq1Ho9q_ZdFcAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0107.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::43) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8570516f-9732-4741-ac58-08da90de06c1
X-MS-TrafficTypeDiagnostic: DM8PR11MB5701:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	T2E2JIC300KCOSGIQWR6RgCF9MOFuO3mTtpxq+98WPWdjBtSFdIFLPQK/Fjh9XxcLKJJC18AjQxRqcp30cngS0deSyPFU61rXPSrA93STLfHvsSqb8bSyYUF+6+l3fMwhKtEqnoeRuE8kAS3z4omcXKBm1mWY/BS7K+Zo71Gk9IJTWSZr577SUFo6ihYxFh5+YhekY+yxRSuIbuRXscPXn2NxruQDio7IWzV+p1TMr7grxwnYIuXHOt0C/5IfdJk13WOyCsVXvlEb5jBNdiHE3kM3quTEsd91CNFUIX72qRtqRjI0lQa7oTk0DRJdMeFA2xYxqCrSHTPr/HMGKrEvb21jp/xJodsBL1DAmP8sY9+O5X+y10j2ToSz9/47JrHOOT5J2YNe1744WgVDPmvQgoQy18R/keBT86e5eHk/ObqLAoedQkxgdgWv1iWtoJERy4ErrnZvb3JVXa6WDW4cvulbtjo3aboe1s7F+m9fcp+PUzsRF6Fv7/K7Wo5iVZt7veU6mSEpNOg09t3qN968w/tT644RKAW07FVX5Irn7xBOv430eYp6E/poPsABPoIpi3Gn0J/VKD59uKi4jZGXjyy3xhPOb2bZj1ZrL2SZl/lz45mLw9jVpyP27nR+/iFA2CiPrldsePK9qzgHGm1vSXI1usuBgc+3zM2KBeBtQQGFv3cgZT5dncYsovj+Licp3A+rA3YhYNn9XZK5iTJbZ70DHG4CL8AbLjg9TMKORV79uX081N6Etxa+5ru9iXD/H3b/b+pJCW4eplnP2zIWdXxIXHyG9HtS6Y8P7so/9WwrET5ZwCYZBddW9gQ+lzU3nMl8qn8VexLV5G92hml62F22yBfJYVUfgqDk0Z0C4A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(346002)(39850400004)(376002)(366004)(38100700002)(5660300002)(316002)(83380400001)(36756003)(30864003)(66476007)(8936002)(4326008)(44832011)(66556008)(66946007)(2906002)(31686004)(6916009)(8676002)(6486002)(966005)(41300700001)(31696002)(26005)(6512007)(186003)(478600001)(2616005)(86362001)(53546011)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MVhxWVo1WDZ1TlY0S0VuSU5qSWE1THZTcW83NnhvWlFxeDN6RE5Wd3BEaWtM?=
 =?utf-8?B?YUlWWUYrM0M4alBmTlplUFBtbDFlR2hXSU9iSnFNTEpjcWZhRFV2YzdEZUh0?=
 =?utf-8?B?N3JDVm9pRG1CbzY5TWpRYUoyaDhwcnB2dUYra05ETEFWT3lCMzRPMVJZUlF3?=
 =?utf-8?B?WXUzY01ycVkzbU16c0ZVQytpeTBXbTRVRG9MOE5vSzh5YWdiY3ltYXZhamJ0?=
 =?utf-8?B?K1lNNmYvTkhWbjQzajJodGE0Q3o1ZnNsT3JVRUcrTjUwMkxYY2ZJUHhGa0lo?=
 =?utf-8?B?TzBGdkYvZE1vSUZHbWRDM2l6cE5QRGk4YXdOMG5PS290MVdXRUN6NUhFMi9I?=
 =?utf-8?B?Y3AxN3F4bWRmYU5XRXdFTmJsT3NXdFBQdXU5RTN1N0c1eE5WMGdKYUIvNUVo?=
 =?utf-8?B?T2k1WlZKMU5pdjdUcy9QRXRmRGNPeUxKRWJRdEJUd281UTV1MWhHRzNiUjds?=
 =?utf-8?B?VVpmWXh3dDJ3TDlycU5tMlRuYkQ3VkpMaXlTSFV0SkY0SElyczJTVStnd2dj?=
 =?utf-8?B?WmpURHhiN284LzZnOStzY29GR2xRcnplcnJBZGF0bmpEUHJJeUFTZTN5d0pN?=
 =?utf-8?B?cXhXbUJCb1RaeUtQZEFLY28wMTNyemJvZU5qbWNvMmRJVHhuUEZ1UFp5S3JI?=
 =?utf-8?B?OEVpNnRXaVp0U0xYTjhkbk51Z1FCczRuanFQR0xabngyMmJ5U2tJdzJ1NEhI?=
 =?utf-8?B?SGE2dkFKOTdWQlRwOVQ3V0ZvTHd4Zjg5Y3dENXo2cGw2citrQlltaXh2SEdw?=
 =?utf-8?B?R2xLSjQ5aVBuZzVjWCtRNFk1WVgxWTAvb0N6bWd0MkgwMGgxb2RtUDBDV09z?=
 =?utf-8?B?Mm1PUDBISncxVnJZaXl6Nm92QlFJTEZPZXM3bTRySTBQYlQrYTNWNTlsYWE2?=
 =?utf-8?B?TkxpR0JsZFhuSTdmbGtJR1FrZjhSRzNZUFFNTHJwWnc4M3JDT0tKZVNJYXBi?=
 =?utf-8?B?TU04TlFWRDIrSHpGejlXcFZsT0pad0t3SE1XOUhrczlyOUJCTzZ4bERFZ0sr?=
 =?utf-8?B?bXdxbUF5VWtaTWR3MTdYVFZlcXlFYk1nR1FHaDRIMGRWakRLTXdCWTlwU3ZI?=
 =?utf-8?B?QzJyMVc2Ty9xT21NczJNZjUwOUxjaVJoelV3QitDUlpNYUJia2tDaTc5TExC?=
 =?utf-8?B?aWhwcjNSMTU4Rm9hVmxCdXgwaHVjRFg4S2FkRmdxOU4wMnFNZXNLWnhBeUla?=
 =?utf-8?B?UW9vb1ZjTU1EQXR4YWVPbFNaT0VDUnUrZTdoQUJpL0JZRGllRXFNbmI2MDcy?=
 =?utf-8?B?Rm1PZjNYYTJlS0s2M3RORTM2Y2JiNExIakQ2ci91ZnBUNitZajJoNEkzcVo1?=
 =?utf-8?B?UEw0aG1TeDM2amRiMWtrQzVIL1NLTWZkT2ZyeUkreGZsWkRESytKeTNCUE11?=
 =?utf-8?B?RVlueEtEc1hXeWlYSmxPczZmTGs1NjBGS2xhWU5vTUkxN0lJV3I3SGYyL1RT?=
 =?utf-8?B?ZXRxWDRmcUVJQUVDczhaZHFuYUR2QUJjeHFseTZVUDg3Um9vWlB4akRRa1pn?=
 =?utf-8?B?emVNdE55eEtHMUdMNXZWUlpkS1BDVTd1cmtvT29wRkM4KzdyenN5NDUxWkZp?=
 =?utf-8?B?VEs2TkQyTW15Tk5pQS9MRkx5RUk2QTlLeXA3c2NSK1BsWkFvMVlYVXZ3bGhv?=
 =?utf-8?B?dzdQWklTZ1pnZXBNZEFFM1d4bDhrMVVNU2FISnZlNUJhWkJWWkdCVlZYcUlL?=
 =?utf-8?B?NUhURWVPRlVtQVFSOGV3UEp1Z1FRaUtFTkR4UG1HQytPM2dmb2ZycS9TbXM1?=
 =?utf-8?B?UXIwOWJSWlVVbWFjZjFOdVBKSWhhaEI2Y0dRcU93ZDZvMUt1amxIbG4rbVJj?=
 =?utf-8?B?QmNheDVEa0pzUjB3ZlJDWGxXTEJmTWpZVDZmaDN3Sm9RUnhXZXFtcDZ2Ym53?=
 =?utf-8?B?ckl3MjkzNFloSDJvbkVIQ0pRZVA4NHNNQS9Ca2xQZDF4UHUrcU9BcG9PMnhE?=
 =?utf-8?B?MHhuTmd6VUxNN3RoRzliNzJKZVJhRjNMK0JWNFJYUmhNVFIyUy84L0laSGpD?=
 =?utf-8?B?cXlPdlJ6cWN4U1dLd1B0NVZJRnRRVUl6RFJHMmdKZnhPQmtxcVdtaXBVZ3BO?=
 =?utf-8?B?VnU4SjhUR2NCTVppNW5EZHl3bU0xWWNxT3FtU25ia3RxV2lJKy8weWczY3R3?=
 =?utf-8?B?VWRwRklKcEtLYUFObXk2ckZ2SGxyOEVWTmR2VU00VlVWSnE4Uk1UWFFzMmdW?=
 =?utf-8?B?N1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8570516f-9732-4741-ac58-08da90de06c1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 14:34:09.8091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 MhwBUCeCGrHd4t4D9qoyqv2iexWEQ7w2igP+Hyd3sw4VC3uUZY1Q67pJAh/pNKOodLm8VTG9TwLGocRBaMLQ795jzhk270iQ6C+YISEtB4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5701
X-Proofpoint-GUID: NayBh-TnikjEe0pTmYjs5z2UTk3mk5X2
X-Proofpoint-ORIG-GUID: NayBh-TnikjEe0pTmYjs5z2UTk3mk5X2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-07_08,2022-09-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 impostorscore=0 suspectscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209070056
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 07 Sep 2022 14:34:15 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7610


On 2022-09-06 22:37, Bruce Ashfield wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Since you just sent an update to master for ceph, I'll assume this
> isn't for master ? Is it for kirkstone ?
>
> Bruce
Sorry for the confusion, that patch was an RFC for a compilation issue i 
am facing with the uprev.
>
> On Tue, Sep 6, 2022 at 6:07 PM <sakib.sajal@windriver.com> wrote:
>> Backport required patches to fix CVE-2022-0670.
>>
>> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>> ---
>>   .../ceph/ceph/CVE-2022-0670_1.patch           | 114 ++++++++++++++++++
>>   .../ceph/ceph/CVE-2022-0670_2.patch           |  67 ++++++++++
>>   recipes-extended/ceph/ceph_15.2.15.bb         |   2 +
>>   3 files changed, 183 insertions(+)
>>   create mode 100644 recipes-extended/ceph/ceph/CVE-2022-0670_1.patch
>>   create mode 100644 recipes-extended/ceph/ceph/CVE-2022-0670_2.patch
>>
>> diff --git a/recipes-extended/ceph/ceph/CVE-2022-0670_1.patch b/recipes-extended/ceph/ceph/CVE-2022-0670_1.patch
>> new file mode 100644
>> index 0000000..ea790d3
>> --- /dev/null
>> +++ b/recipes-extended/ceph/ceph/CVE-2022-0670_1.patch
>> @@ -0,0 +1,114 @@
>> +From 0cd1d8aa5ac935f738365ba38b397cae0fc9179c Mon Sep 17 00:00:00 2001
>> +From: Kotresh HR <khiremat@redhat.com>
>> +Date: Fri, 4 Feb 2022 14:55:03 +0530
>> +Subject: [PATCH] mgr/volumes: Fix subvolume discover during upgrade
>> +
>> +Fixes the subvolume discover to use the correct
>> +metadata file after an upgrade from legacy subvolume
>> +to v1. The fix makes sure, it doesn't use the
>> +handcrafted metadata file placed in the subvolume
>> +root of legacy subvolume.
>> +
>> +Co-authored-by: Arthur Outhenin-Chalandre <arthur.outhenin-chalandre@cern.ch>
>> +Co-authored-by: Dan van der Ster <daniel.vanderster@cern.ch>
>> +Co-authored-by: Ramana Raja <rraja@redhat.com>
>> +Signed-off-by: Kotresh HR <khiremat@redhat.com>
>> +(cherry picked from commit 7eba9cab6cfb9a13a84062177d7a0fa228311e13)
>> +
>> +Upstream-Status: Backport [0cd1d8aa5ac935f738365ba38b397cae0fc9179c]
>> +CVE: CVE-2022-0670
>> +
>> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>> +---
>> + .../fs/operations/versions/metadata_manager.py  | 17 ++++++++++++++---
>> + .../fs/operations/versions/subvolume_base.py    | 17 ++++++++++++++++-
>> + 2 files changed, 30 insertions(+), 4 deletions(-)
>> +
>> +diff --git a/src/pybind/mgr/volumes/fs/operations/versions/metadata_manager.py b/src/pybind/mgr/volumes/fs/operations/versions/metadata_manager.py
>> +index 1b6c4327837..cb3059e5653 100644
>> +--- a/src/pybind/mgr/volumes/fs/operations/versions/metadata_manager.py
>> ++++ b/src/pybind/mgr/volumes/fs/operations/versions/metadata_manager.py
>> +@@ -40,16 +40,17 @@ class MetadataManager(object):
>> +     def refresh(self):
>> +         fd = None
>> +         conf_data = StringIO()
>> ++        log.debug("opening config {0}".format(self.config_path))
>> +         try:
>> +-            log.debug("opening config {0}".format(self.config_path))
>> +             fd = self.fs.open(self.config_path, os.O_RDONLY)
>> +             while True:
>> +                 data = self.fs.read(fd, -1, MetadataManager.MAX_IO_BYTES)
>> +                 if not len(data):
>> +                     break
>> +                 conf_data.write(data.decode('utf-8'))
>> +-            conf_data.seek(0)
>> +-            self.config.readfp(conf_data)
>> ++        except UnicodeDecodeError:
>> ++            raise MetadataMgrException(-errno.EINVAL,
>> ++                    "failed to decode, erroneous metadata config '{0}'".format(self.config_path))
>> +         except cephfs.ObjectNotFound:
>> +             raise MetadataMgrException(-errno.ENOENT, "metadata config '{0}' not found".format(self.config_path))
>> +         except cephfs.Error as e:
>> +@@ -58,6 +59,16 @@ class MetadataManager(object):
>> +             if fd is not None:
>> +                 self.fs.close(fd)
>> +
>> ++        conf_data.seek(0)
>> ++        try:
>> ++            if sys.version_info >= (3, 2):
>> ++                self.config.read_file(conf_data)
>> ++            else:
>> ++                self.config.readfp(conf_data)
>> ++        except configparser.Error:
>> ++            raise MetadataMgrException(-errno.EINVAL, "failed to parse, erroneous metadata config "
>> ++                    "'{0}'".format(self.config_path))
>> ++
>> +     def flush(self):
>> +         # cull empty sections
>> +         for section in list(self.config.sections()):
>> +diff --git a/src/pybind/mgr/volumes/fs/operations/versions/subvolume_base.py b/src/pybind/mgr/volumes/fs/operations/versions/subvolume_base.py
>> +index 2840a9f2ea3..b499d242e3b 100644
>> +--- a/src/pybind/mgr/volumes/fs/operations/versions/subvolume_base.py
>> ++++ b/src/pybind/mgr/volumes/fs/operations/versions/subvolume_base.py
>> +@@ -5,6 +5,7 @@ import errno
>> + import logging
>> + from hashlib import md5
>> + from typing import Dict, Union
>> ++from pathlib import Path
>> +
>> + import cephfs
>> +
>> +@@ -123,6 +124,15 @@ class SubvolumeBase(object):
>> +         raise NotImplementedError
>> +
>> +     def load_config(self):
>> ++        try:
>> ++            self.fs.stat(self.legacy_config_path)
>> ++            self.legacy_mode = True
>> ++        except cephfs.Error as e:
>> ++            pass
>> ++
>> ++        log.debug("loading config "
>> ++                  "'{0}' [mode: {1}]".format(self.subvolname, "legacy"
>> ++                                             if self.legacy_mode else "new"))
>> +         if self.legacy_mode:
>> +             self.metadata_mgr = MetadataManager(self.fs, self.legacy_config_path, 0o640)
>> +         else:
>> +@@ -271,8 +281,13 @@ class SubvolumeBase(object):
>> +             self.fs.stat(self.base_path)
>> +             self.metadata_mgr.refresh()
>> +             log.debug("loaded subvolume '{0}'".format(self.subvolname))
>> ++            subvolpath = self.metadata_mgr.get_global_option(MetadataManager.GLOBAL_META_KEY_PATH)
>> ++            if not self.legacy_mode and self.base_path.decode('utf-8') != str(Path(subvolpath).parent):
>> ++                raise MetadataMgrException(-errno.ENOENT, 'fabricated .meta')
>> +         except MetadataMgrException as me:
>> +-            if me.errno == -errno.ENOENT and not self.legacy_mode:
>> ++            if me.errno in (-errno.ENOENT, -errno.EINVAL) and not self.legacy_mode:
>> ++                log.warn("subvolume '{0}', {1}, "
>> ++                          "assuming legacy_mode".format(self.subvolname, me.error_str))
>> +                 self.legacy_mode = True
>> +                 self.load_config()
>> +                 self.discover()
>> +--
>> +2.25.1
>> +
>> diff --git a/recipes-extended/ceph/ceph/CVE-2022-0670_2.patch b/recipes-extended/ceph/ceph/CVE-2022-0670_2.patch
>> new file mode 100644
>> index 0000000..dad466b
>> --- /dev/null
>> +++ b/recipes-extended/ceph/ceph/CVE-2022-0670_2.patch
>> @@ -0,0 +1,67 @@
>> +From c774e03c29955f0fb668af6190a9750d03bb09b8 Mon Sep 17 00:00:00 2001
>> +From: Kotresh HR <khiremat@redhat.com>
>> +Date: Thu, 9 Jun 2022 13:30:59 +0530
>> +Subject: [PATCH] mgr/volumes: V2 Fix for
>> + test_subvolume_retain_snapshot_invalid_recreate
>> +
>> +Signed-off-by: Kotresh HR <khiremat@redhat.com>
>> +
>> +Upstream-Status: Backport [c774e03c29955f0fb668af6190a9750d03bb09b8]
>> +CVE: CVE-2022-0670
>> +
>> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>> +
>> +---
>> + .../mgr/volumes/fs/operations/versions/subvolume_base.py  | 8 ++++++--
>> + .../mgr/volumes/fs/operations/versions/subvolume_v1.py    | 2 +-
>> + 2 files changed, 7 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/src/pybind/mgr/volumes/fs/operations/versions/subvolume_base.py b/src/pybind/mgr/volumes/fs/operations/versions/subvolume_base.py
>> +index b499d242e3b..aba8c90cf67 100644
>> +--- a/src/pybind/mgr/volumes/fs/operations/versions/subvolume_base.py
>> ++++ b/src/pybind/mgr/volumes/fs/operations/versions/subvolume_base.py
>> +@@ -17,6 +17,7 @@ from ...fs_util import get_ancestor_xattr
>> + from ...exception import MetadataMgrException, VolumeException
>> + from .op_sm import SubvolumeOpSm
>> + from .auth_metadata import AuthMetadataManager
>> ++from .subvolume_attrs import SubvolumeStates
>> +
>> + log = logging.getLogger(__name__)
>> +
>> +@@ -112,7 +113,7 @@ class SubvolumeBase(object):
>> +     @property
>> +     def state(self):
>> +         """ Subvolume state, one of SubvolumeStates """
>> +-        raise NotImplementedError
>> ++        return SubvolumeStates.from_value(self.metadata_mgr.get_global_option(MetadataManager.GLOBAL_META_KEY_STATE))
>> +
>> +     @property
>> +     def subvol_type(self):
>> +@@ -282,7 +283,10 @@ class SubvolumeBase(object):
>> +             self.metadata_mgr.refresh()
>> +             log.debug("loaded subvolume '{0}'".format(self.subvolname))
>> +             subvolpath = self.metadata_mgr.get_global_option(MetadataManager.GLOBAL_META_KEY_PATH)
>> +-            if not self.legacy_mode and self.base_path.decode('utf-8') != str(Path(subvolpath).parent):
>> ++            # subvolume with retained snapshots has empty path, don't mistake it for
>> ++            # fabricated metadata.
>> ++            if (not self.legacy_mode and self.state != SubvolumeStates.STATE_RETAINED and
>> ++                self.base_path.decode('utf-8') != str(Path(subvolpath).parent)):
>> +                 raise MetadataMgrException(-errno.ENOENT, 'fabricated .meta')
>> +         except MetadataMgrException as me:
>> +             if me.errno in (-errno.ENOENT, -errno.EINVAL) and not self.legacy_mode:
>> +diff --git a/src/pybind/mgr/volumes/fs/operations/versions/subvolume_v1.py b/src/pybind/mgr/volumes/fs/operations/versions/subvolume_v1.py
>> +index f7b13f17c77..9e772653ba5 100644
>> +--- a/src/pybind/mgr/volumes/fs/operations/versions/subvolume_v1.py
>> ++++ b/src/pybind/mgr/volumes/fs/operations/versions/subvolume_v1.py
>> +@@ -673,7 +673,7 @@ class SubvolumeV1(SubvolumeBase, SubvolumeTemplate):
>> +
>> +     @property
>> +     def state(self):
>> +-        return SubvolumeStates.from_value(self.metadata_mgr.get_global_option(MetadataManager.GLOBAL_META_KEY_STATE))
>> ++        return super(SubvolumeV1, self).state
>> +
>> +     @state.setter
>> +     def state(self, val):
>> +--
>> +2.25.1
>> +
>> diff --git a/recipes-extended/ceph/ceph_15.2.15.bb b/recipes-extended/ceph/ceph_15.2.15.bb
>> index f2ece8c..d63051c 100644
>> --- a/recipes-extended/ceph/ceph_15.2.15.bb
>> +++ b/recipes-extended/ceph/ceph_15.2.15.bb
>> @@ -17,6 +17,8 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
>>              file://0001-buffer.h-add-missing-header-file-due-to-gcc-upgrade.patch \
>>              file://0002-common-fix-FTBFS-due-to-dout-need_dynamic-on-GCC-12.patch \
>>              file://CVE-2021-3979.patch \
>> +           file://CVE-2022-0670_1.patch \
>> +           file://CVE-2022-0670_2.patch \
>>   "
>>
>>   SRC_URI[sha256sum] = "5dccdaff2ebe18d435b32bfc06f8b5f474bf6ac0432a6a07d144b7c56700d0bf"
>> --
>> 2.33.0
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#7601): https://lists.yoctoproject.org/g/meta-virtualization/message/7601
>> Mute This Topic: https://lists.yoctoproject.org/mt/93512577/1050810
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

