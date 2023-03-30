Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59257C761A6
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 15:20:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.28171.1680189624229321086
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 30 Mar 2023 08:20:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=De9sqcpX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34532ef2cb=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32UEes4A028895;
	Thu, 30 Mar 2023 15:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=rQkzi7AnSJBQgBm81JEt6ZWSWFU7mx2KlY7X2hoy23o=;
 b=De9sqcpXT1z4+aBzCXoZbUD+70eo/xliV0wClOFZi1R8IZgx+/22hTVQeOX4Bs9rPs1N
 /pBmpCoKBsqedsaSyOpGk4tM8iitrFNCpMv9EQHvbcOCooNswEtIxKZCLVh3KaY2/hWY
 ZxA/BnSCC1zFCHOBab8KkPpr2liiLJE5fQ9oesDrEMAizOM53U2rKBY8BBw8Q4bwkpTb
 TTZCyi3net++sDl1/Tg0pc6L3JTAus0P5favaagkGSsYJx21LNR/gsZk09yi/LGFiZI0
 MsbC4po3gPTo0HQOr22rhIfZ8/nyxMQmUU+OaviSMM2vl+Nqm1vPQc51agV76GwJ307W Zg== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3php646gf8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Mar 2023 15:20:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HTN5stUm6BWs/cBSWDLNesb2FcDcnMjMIGiu9gnP/ezZoERmHyIO5KUZcqLV1IEyH1rgLSMzMC2EHio/Vf6Czavt0OVYRrFT+MTIJTpYdJX0F/GDQAdv45IYHdJsX8JFzEVnP13R9LTBgNIlpik6sApY3GMjK+4DcsmCAhMLjy0U2ssob4nYzQoPJIri7JBelANB4IBq9A12EJK3MFW9pTlh5Asl3yaHmBI9S45GNFIDr0r0cG5L7T0F73D8tD0/Z2Zb8iwe25useAQJGoclV6YCJs7PcsDKl0J7ieABcx5koSFPfWINDfv/EUzhbb/+6Ce9F2x2OynGZ00tQak3NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQkzi7AnSJBQgBm81JEt6ZWSWFU7mx2KlY7X2hoy23o=;
 b=ScPomjfwVbHhQ8NNyemPpXyL7TEvnyq/XAfAt6/X4e4FaRTLbHGSRRyvTY54Nweu0h94au0XFZHVjjWMkXsfptLG4e7QzDWLCtrihUao6fypzMUDrduaUQx5CIxFWH8qDoGI9hpkCP6koiz+NnkkcfIii8hjj4sRX38gT7lfUygpGyji/Hc4O9Gziz1LX4YOvT/LzLKScB8y2Y6cor47NiZdfHSVtZg51kvfU5nWUwFWbrsyt0W8X97SgFl605OgArSH7uiPX/q4Sw7pyz92WA5TtivNYamuykAnBn5TAnJFdmuz/0K6Oow7p01MXJhs2lwxLkeTwp898iMNJiRntA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 CY5PR11MB6510.namprd11.prod.outlook.com (2603:10b6:930:42::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.41; Thu, 30 Mar 2023 15:20:21 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::4f46:b639:f638:d5f7]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::4f46:b639:f638:d5f7%5]) with mapi id 15.20.6222.035; Thu, 30 Mar 2023
 15:20:21 +0000
Content-Type: multipart/alternative;
 boundary="------------bp9rBevNTrh0ZF01cRnHLosk"
Message-ID: <c74c608b-dfea-5b9a-0a62-65aafad0f956@windriver.com>
Date: Thu, 30 Mar 2023 11:20:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [meta-virtualization][kirkstone][PATCH] kubernetes: update to
 v1.23.17
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20230329215729.719615-1-sakib.sajal@windriver.com>
 <CADkTA4MwijK7T5iX3Xz-5Nm1eoUCvfmgwmjZy90cX9dEKRGCiw@mail.gmail.com>
From: Sakib Sajal <sakib.sajal@windriver.com>
In-Reply-To: <CADkTA4MwijK7T5iX3Xz-5Nm1eoUCvfmgwmjZy90cX9dEKRGCiw@mail.gmail.com>
X-ClientProxiedBy: MN2PR22CA0024.namprd22.prod.outlook.com
 (2603:10b6:208:238::29) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2538:EE_|CY5PR11MB6510:EE_
X-MS-Office365-Filtering-Correlation-Id: 72d5af71-4a55-4e34-4d44-08db313246c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cuEpSynqEi8tVOGxC+yL2jBwM1KvBOi6TTiEFD26okpv5S45E5Y6Q2zVi4wGeCRBKDl9yI/2HIVJP5EpdGcJqH4q2iL0TubQlXWvNXF4JWd3OVMFQGY/lz+FQJx24V+VNjXlWpEHzqdemlwoLZRVP33ZIFR2Dxple1FC8pkmV5x3C0X+uihGJAeuseIkq8phao42ilJg+swjarCDvO9sgZSKyrT4U/B8A626vG70S0HcKUZtr9FRemy6FbW2uIBTLVfuI+DTsisRA6Ppna//y0S/FcK4b0tIy4A8n4AdpzoMSBXAWAmKHT5hTGkci3Txqj1ZkL/kLIRaOd1A1ZMR/xAitgz4OWn5R9gCwpXuo+OmNKSHpveZFbiY7/hdD2Qb97BPXBIDM1FIxhcjeQSLsaMdwY+yZ9Egz6VYgwDbTLy8C0pVfodCxksHAe910kRmrX5oGwlBpOHr4+wVbHko0hs5sHO9LiICP0HD5EC9ch9/cY3MMOLwUoGuTWriE4YT+e3pIrqcUCzyRGV4KrQtoEkoBnatF6sNdBKTuOeAEv8SK+4Ewz9Su9A227Q50hjc8kYxZ+ZtlhBe0ZTtgo7dCsuXB45qfON5qvexkkPF+l4IbwVqol8hPq/NWQ5IwiwKLbARpdeJBfllrLkot5F3inwOLT9RcddaxxwHcx/rBzg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(39850400004)(136003)(396003)(376002)(451199021)(38100700002)(186003)(83380400001)(6506007)(36756003)(53546011)(6512007)(26005)(33964004)(966005)(86362001)(6486002)(41300700001)(31686004)(2906002)(15650500001)(316002)(8936002)(166002)(31696002)(44832011)(8676002)(478600001)(4326008)(6916009)(66476007)(2616005)(66946007)(5660300002)(66556008)(66899021)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UmtNSmdCdVpRUEwxVnlrN2JxeEh4ZjlNRm5hcktMV3NaUWNxMWcrSW91bVNv?=
 =?utf-8?B?VGRqWXc3MXZ5cXpuL3p6dzgyblFoeXJKSmtPaFNEU0lqZlNmbEJoUldsZEpx?=
 =?utf-8?B?MDFBSGx0TGxZclhyKzJsN3VsTm5aUS9tZkJOYmRLck5aeE4zY0tiSlhWc3du?=
 =?utf-8?B?ZDJjTWc0NVNFUVZuOEtWTWxOdWlOcllDQ3g4bzBvWnFPOTlXZXM4WVhmdUpR?=
 =?utf-8?B?Q0VxbVljSW9ZUWFQbHpSSmpzN0xxOFRNZThuOFFOZElabXEvU3Q3Q1M0Und6?=
 =?utf-8?B?dnR2YnFpaWF3SiszenJBVlVudEpDQlVLRkFUSUN6RmVQWS9aWXJRVVBkRkwy?=
 =?utf-8?B?amwxWjlpUHgvdmsxaElPbXNaeGRPTE9FR1hPYnJNNFV0ei84S0MrcFBNZ3hr?=
 =?utf-8?B?WVE2QjNzUmVOdUdaSmhDbm05YnNELytObThJU2xJalhJMWVUNnZDckxqU3Vy?=
 =?utf-8?B?bTBiemhqM3NmSGVwLzFLRTJ4RmR1eXFGbWhBenNSRWxodW54NzZ4aDdWbXdN?=
 =?utf-8?B?S0RjZ3JuL0ZxbUZLSnBZbVRxbGVSS0dlMXlxKzBwSm0yMFFQY2RNaWlRbjNu?=
 =?utf-8?B?TFVaamlIU3gvRDcrS0x1V1h4VG41eEJkWlNWOWY4ODBOZ0xhV1BSbFN2Y2d6?=
 =?utf-8?B?Y1l4WVNHS1hQcld3cm5VOTlPWjhLNjYxVnJSQWVyWXBMaHBORkxneWxnNWQ2?=
 =?utf-8?B?dVo4a2pYbjJHTmRsSjBXQnFRK0JzdHRldVMxb0NQNlgrY0RBMEtGOVFYRE5o?=
 =?utf-8?B?aFdEMUx0UnZaZkVNZDNNejlTT3BocjY3UVluZHZubkdKYTZFUVdWenhHcTZL?=
 =?utf-8?B?VDJVS3FWb1drdEtnSkwvS1dvdjJmcEFYU3FEZUoxOVQ2T0h2dnFBb2Y3NGNY?=
 =?utf-8?B?eHNXRlFtTEZ4OUkyOVc0cnU4OHdHeXpNMGJqVk4xRkVjSTVrZzc4QUxRU00y?=
 =?utf-8?B?RVJLems1RklpMFNiNHZMZHBaUCs5a2R1MmNRbzlLVnAxaEV0RnZmenVhVnZn?=
 =?utf-8?B?NDd2V0FCWWVqbG5SdUdrVDRlTm00VUh2M29CQzZ4VHhZQ2VmbHhmVVoxYjhq?=
 =?utf-8?B?WEF3R2Y1M1RKMk5GY1g2YS9MVEJTdVh3djRJT3BaVDZCeTFCUEN2Q2FEcEZ2?=
 =?utf-8?B?TXRhUm9sWG9VWjVBSjh5UjhMbVRobS9LVEhiV09FVGpYVTNuOWlSMkhhT1ZM?=
 =?utf-8?B?cWVaUVVCU0NxaytqRWZlMmZQSEFCalZIZGJCdlFpVjZFSXIyVVZhZ3ZRcW5a?=
 =?utf-8?B?VWpQYmp3NzRaRkYvNjYxNENFYWlJYWFaT2k0b041dGZFaC8rK1ZtVVJweFV3?=
 =?utf-8?B?NUtiUVhZTEJnQlRkNllFS0JqZDIzaGhLUGl2R0lKN3ByS0NHUy9jZlZ4dHlX?=
 =?utf-8?B?UHQ2RnpLK2l4TWhQNkxrc0xUSWxNdGk2TlFwTEZLT0dnc1owWnVYYmdQaHps?=
 =?utf-8?B?N1llS1h1Z2w1TEJsVTdOSVNMeXJOLzA1WXE5SSswT2l6dGloTHptU1IwUE1a?=
 =?utf-8?B?SUhsdHo1QUpEMkd6UVFuQnRoTGhDdmwzWUNMclpTbmtKeTFySkpja1F0UE8v?=
 =?utf-8?B?TmNGb01MaTdiOGVjOFlISFBCcCtTVzhQU3MwNGlWYlVkTklBdVZZanFjcHFE?=
 =?utf-8?B?bFRxUThuemZma3lRTkRET0ZUc0xTazN2OSs0MW1XR3c2Mk1tOUlGQ1FJQ2Jx?=
 =?utf-8?B?UVhDQ1FsZmx2RTJzMVJ0Z0xQeW5sY3Nza0tGWXNpUlBQT3BTZmxoMWd2WXhG?=
 =?utf-8?B?WUo3ckR2RitTUld0Y251NmYraUl5dThnd0Zqc2RiNUpBc2xPQktFQm53TWF2?=
 =?utf-8?B?dlBpWFFwT2pybTJxQ2svSy9GK0tHSFRWSHlxdmRkb284ZXMzS09VNHVXTlNz?=
 =?utf-8?B?U2NHaG96NmRsMm8wUTdaWVdpZzk4V2x4MEVRWkUyVEd6b0NuUnJkRG4xdEVX?=
 =?utf-8?B?TVkwenAzcGRKWmxTaEFuVE9RZXR4eXVKVHJOUGg0aGl3c3pqSHV2MGxUUkdX?=
 =?utf-8?B?Q1NabHhTT1ZySFkzQ1dVSmIvNW9ITHl2VThzeXZQNDRzWEt2ZHcxN08wU2V5?=
 =?utf-8?B?djRqZUQvVXpLV3VGNGF0cm1tUHZXNFVuWXc1ZjJWK0Vjb0xIWW9iTWhTTnFx?=
 =?utf-8?B?K01SM2xUS2t3OVBwZDErTlQrUS9GRk02M2licWJ6MTYzMFVscnYyNGFMc2cz?=
 =?utf-8?B?T3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72d5af71-4a55-4e34-4d44-08db313246c7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 15:20:21.0986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PV9xcYsLfynR2il/2BJKFIe3wWsrzqyZUQ5gPsXbfzsPgqgCr5F1U+8QnVDkBV2d60cRmvXzPWaJM3E4oS68XAawmTzHO4vPTpA4NaSWkog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6510
X-Proofpoint-ORIG-GUID: e2sukRnKsuV16zaYHdHOt_x8sGplxVx6
X-Proofpoint-GUID: e2sukRnKsuV16zaYHdHOt_x8sGplxVx6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-30_09,2023-03-30_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=939 priorityscore=1501
 lowpriorityscore=0 clxscore=1011 mlxscore=0 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303300121
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 30 Mar 2023 15:20:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7973

--------------bp9rBevNTrh0ZF01cRnHLosk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 32UEes4A028895


On 2023-03-29 23:17, Bruce Ashfield wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
> Please do list them in the log. Simply listing the number isn't useful.
>
> We aren't charged by the byte of text=C2=A0 ;)
>
> Bruce

Done

Sakib

>
> On Wed, Mar 29, 2023, 5:59 PM <sakib.sajal@windriver.com> wrote:
>
>     Bumping kubernetes to version v1.23.17, which comprises of 251
>     commits,
>     so not listing them in the log:
>     =C2=A0 $ git log --no-merges --oneline fbcfa330..953be892 | wc -l
>     =C2=A0 =C2=A0 251
>
>     Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>     ---
>     =C2=A0recipes-containers/kubernetes/kubernetes_git.bb
>     <https://urldefense.com/v3/__http://kubernetes_git.bb__;!!AjveYdw8E=
vQ!ZKYf5EIEBDwO0mRXhYtc70dLmZxAoXn8NGA2vw6-7ovorH_yjujNtSgFoj3Ylu-dDjBUm6=
zMvqaRTAxWR2G6mZErm1Cp$>
>     | 4 ++--
>     =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>
>     diff --git a/recipes-containers/kubernetes/kubernetes_git.bb
>     <https://urldefense.com/v3/__http://kubernetes_git.bb__;!!AjveYdw8E=
vQ!ZKYf5EIEBDwO0mRXhYtc70dLmZxAoXn8NGA2vw6-7ovorH_yjujNtSgFoj3Ylu-dDjBUm6=
zMvqaRTAxWR2G6mZErm1Cp$>
>     b/recipes-containers/kubernetes/kubernetes_git.bb
>     <https://urldefense.com/v3/__http://kubernetes_git.bb__;!!AjveYdw8E=
vQ!ZKYf5EIEBDwO0mRXhYtc70dLmZxAoXn8NGA2vw6-7ovorH_yjujNtSgFoj3Ylu-dDjBUm6=
zMvqaRTAxWR2G6mZErm1Cp$>
>     index 170a938..f475bd7 100644
>     --- a/recipes-containers/kubernetes/kubernetes_git.bb
>     <https://urldefense.com/v3/__http://kubernetes_git.bb__;!!AjveYdw8E=
vQ!ZKYf5EIEBDwO0mRXhYtc70dLmZxAoXn8NGA2vw6-7ovorH_yjujNtSgFoj3Ylu-dDjBUm6=
zMvqaRTAxWR2G6mZErm1Cp$>
>     +++ b/recipes-containers/kubernetes/kubernetes_git.bb
>     <https://urldefense.com/v3/__http://kubernetes_git.bb__;!!AjveYdw8E=
vQ!ZKYf5EIEBDwO0mRXhYtc70dLmZxAoXn8NGA2vw6-7ovorH_yjujNtSgFoj3Ylu-dDjBUm6=
zMvqaRTAxWR2G6mZErm1Cp$>
>     @@ -5,8 +5,8 @@ applications across multiple hosts, providing
>     basic mechanisms for deployment, \
>     =C2=A0maintenance, and scaling of applications. \
>     =C2=A0"
>
>     -PV =3D "v1.23.6+git${SRCREV_kubernetes}"
>     -SRCREV_kubernetes =3D "fbcfa33018159c033aee77b0d5456df6771aa9b5"
>     +PV =3D "v1.23.17+git${SRCREV_kubernetes}"
>     +SRCREV_kubernetes =3D "953be8927218ec8067e1af2641e540238ffd7576"
>     =C2=A0SRCREV_kubernetes-release =3D
>     "7c1aa83dac555de6f05500911467b70aca4949f0"
>     =C2=A0PE =3D "1"
>
>     --=20
>     2.40.0
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#7966):
>     https://lists.yoctoproject.org/g/meta-virtualization/message/7966
>     <https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-=
virtualization/message/7966__;!!AjveYdw8EvQ!ZKYf5EIEBDwO0mRXhYtc70dLmZxAo=
Xn8NGA2vw6-7ovorH_yjujNtSgFoj3Ylu-dDjBUm6zMvqaRTAxWR2G6mVTebEqy$>
>     Mute This Topic:
>     https://lists.yoctoproject.org/mt/97939317/1050810
>     <https://urldefense.com/v3/__https://lists.yoctoproject.org/mt/9793=
9317/1050810__;!!AjveYdw8EvQ!ZKYf5EIEBDwO0mRXhYtc70dLmZxAoXn8NGA2vw6-7ovo=
rH_yjujNtSgFoj3Ylu-dDjBUm6zMvqaRTAxWR2G6mf8i1Fz8$>
>     Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>     <mailto:meta-virtualization%2Bowner@lists.yoctoproject.org>
>     Unsubscribe:
>     https://lists.yoctoproject.org/g/meta-virtualization/unsub
>     <https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-=
virtualization/unsub__;!!AjveYdw8EvQ!ZKYf5EIEBDwO0mRXhYtc70dLmZxAoXn8NGA2=
vw6-7ovorH_yjujNtSgFoj3Ylu-dDjBUm6zMvqaRTAxWR2G6mdC1KjaB$>
>     [bruce.ashfield@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------bp9rBevNTrh0ZF01cRnHLosk
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2023-03-29 23:17, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CADkTA4MwijK7T5iX3Xz-5Nm1eoUCvfmgwmjZy90cX9dEKRGCiw@mail.gmail.com">
      
      <strong>
      </strong>
      <div style="border:solid #9c6500
        1pt;padding:2pt;background:#fcfc03"><strong><class="msonormal" style="line-height:11pt"><span style="font-size:11pt;color:#000">CAUTION: This email
              comes from a non Wind River email account!</span></class="msonormal"></strong><br>
        <class="msonormal" style="line-height:10pt3"><span style="font-size:10pt;color:#000">Do not click links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        </class="msonormal"></div>
      <div>
        <div dir="auto">
          <div>Please do list them in the log. Simply listing the number
            isn't useful.</div>
          <div dir="auto"><br>
          </div>
          <div dir="auto">We aren't charged by the byte of text&nbsp; ;)</div>
          <div dir="auto"><br>
          </div>
          <div dir="auto">Bruce <br>
          </div>
        </div>
      </div>
    </blockquote>
    <p>Done</p>
    <p>Sakib<br>
    </p>
    <blockquote type="cite" cite="mid:CADkTA4MwijK7T5iX3Xz-5Nm1eoUCvfmgwmjZy90cX9dEKRGCiw@mail.gmail.com">
      <div>
        <div dir="auto">
          <div dir="auto">
            <br>
            <div class="gmail_quote" dir="auto">
              <div dir="ltr" class="gmail_attr">On Wed, Mar 29, 2023,
                5:59 PM &lt;<a href="mailto:sakib.sajal@windriver.com" moz-do-not-send="true" class="moz-txt-link-freetext">sakib.sajal@windriver.com</a>&gt;
                wrote:<br>
              </div>
              <blockquote class="gmail_quote" style="margin:0 0 0
                .8ex;border-left:1px #ccc solid;padding-left:1ex">
                Bumping kubernetes to version v1.23.17, which comprises
                of 251 commits,<br>
                so not listing them in the log:<br>
                &nbsp; $ git log --no-merges --oneline fbcfa330..953be892 |
                wc -l<br>
                &nbsp; &nbsp; 251<br>
                <br>
                Signed-off-by: Sakib Sajal &lt;<a href="mailto:sakib.sajal@windriver.com" target="_blank" rel="noreferrer" moz-do-not-send="true" class="moz-txt-link-freetext">sakib.sajal@windriver.com</a>&gt;<br>
                ---<br>
                &nbsp;recipes-containers/kubernetes/<a href="https://urldefense.com/v3/__http://kubernetes_git.bb__;!!AjveYdw8EvQ!ZKYf5EIEBDwO0mRXhYtc70dLmZxAoXn8NGA2vw6-7ovorH_yjujNtSgFoj3Ylu-dDjBUm6zMvqaRTAxWR2G6mZErm1Cp$" rel="noreferrer noreferrer" target="_blank" moz-do-not-send="true">kubernetes_git.bb</a> | 4 ++--<br>
                &nbsp;1 file changed, 2 insertions(+), 2 deletions(-)<br>
                <br>
                diff --git a/recipes-containers/kubernetes/<a href="https://urldefense.com/v3/__http://kubernetes_git.bb__;!!AjveYdw8EvQ!ZKYf5EIEBDwO0mRXhYtc70dLmZxAoXn8NGA2vw6-7ovorH_yjujNtSgFoj3Ylu-dDjBUm6zMvqaRTAxWR2G6mZErm1Cp$" rel="noreferrer noreferrer" target="_blank" moz-do-not-send="true">kubernetes_git.bb</a>
                b/recipes-containers/kubernetes/<a href="https://urldefense.com/v3/__http://kubernetes_git.bb__;!!AjveYdw8EvQ!ZKYf5EIEBDwO0mRXhYtc70dLmZxAoXn8NGA2vw6-7ovorH_yjujNtSgFoj3Ylu-dDjBUm6zMvqaRTAxWR2G6mZErm1Cp$" rel="noreferrer noreferrer" target="_blank" moz-do-not-send="true">kubernetes_git.bb</a><br>
                index 170a938..f475bd7 100644<br>
                --- a/recipes-containers/kubernetes/<a href="https://urldefense.com/v3/__http://kubernetes_git.bb__;!!AjveYdw8EvQ!ZKYf5EIEBDwO0mRXhYtc70dLmZxAoXn8NGA2vw6-7ovorH_yjujNtSgFoj3Ylu-dDjBUm6zMvqaRTAxWR2G6mZErm1Cp$" rel="noreferrer noreferrer" target="_blank" moz-do-not-send="true">kubernetes_git.bb</a><br>
                +++ b/recipes-containers/kubernetes/<a href="https://urldefense.com/v3/__http://kubernetes_git.bb__;!!AjveYdw8EvQ!ZKYf5EIEBDwO0mRXhYtc70dLmZxAoXn8NGA2vw6-7ovorH_yjujNtSgFoj3Ylu-dDjBUm6zMvqaRTAxWR2G6mZErm1Cp$" rel="noreferrer noreferrer" target="_blank" moz-do-not-send="true">kubernetes_git.bb</a><br>
                @@ -5,8 +5,8 @@ applications across multiple hosts,
                providing basic mechanisms for deployment, \<br>
                &nbsp;maintenance, and scaling of applications. \<br>
                &nbsp;&quot;<br>
                <br>
                -PV = &quot;v1.23.6+git${SRCREV_kubernetes}&quot;<br>
                -SRCREV_kubernetes =
                &quot;fbcfa33018159c033aee77b0d5456df6771aa9b5&quot;<br>
                +PV = &quot;v1.23.17+git${SRCREV_kubernetes}&quot;<br>
                +SRCREV_kubernetes =
                &quot;953be8927218ec8067e1af2641e540238ffd7576&quot;<br>
                &nbsp;SRCREV_kubernetes-release =
                &quot;7c1aa83dac555de6f05500911467b70aca4949f0&quot;<br>
                &nbsp;PE = &quot;1&quot;<br>
                <br>
                -- <br>
                2.40.0<br>
                <br>
                <br>
                -=-=-=-=-=-=-=-=-=-=-=-<br>
                Links: You receive all messages sent to this group.<br>
                View/Reply Online (#7966): <a href="https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-virtualization/message/7966__;!!AjveYdw8EvQ!ZKYf5EIEBDwO0mRXhYtc70dLmZxAoXn8NGA2vw6-7ovorH_yjujNtSgFoj3Ylu-dDjBUm6zMvqaRTAxWR2G6mVTebEqy$" rel="noreferrer noreferrer" target="_blank" moz-do-not-send="true">
https://lists.yoctoproject.org/g/meta-virtualization/message/7966</a><br>
                Mute This Topic: <a href="https://urldefense.com/v3/__https://lists.yoctoproject.org/mt/97939317/1050810__;!!AjveYdw8EvQ!ZKYf5EIEBDwO0mRXhYtc70dLmZxAoXn8NGA2vw6-7ovorH_yjujNtSgFoj3Ylu-dDjBUm6zMvqaRTAxWR2G6mf8i1Fz8$" rel="noreferrer noreferrer" target="_blank" moz-do-not-send="true">
                  https://lists.yoctoproject.org/mt/97939317/1050810</a><br>
                Group Owner: <a href="mailto:meta-virtualization%2Bowner@lists.yoctoproject.org" target="_blank" rel="noreferrer" moz-do-not-send="true">
                  meta-virtualization+owner@lists.yoctoproject.org</a><br>
                Unsubscribe: <a href="https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-virtualization/unsub__;!!AjveYdw8EvQ!ZKYf5EIEBDwO0mRXhYtc70dLmZxAoXn8NGA2vw6-7ovorH_yjujNtSgFoj3Ylu-dDjBUm6zMvqaRTAxWR2G6mdC1KjaB$" rel="noreferrer noreferrer" target="_blank" moz-do-not-send="true">
https://lists.yoctoproject.org/g/meta-virtualization/unsub</a> [<a href="mailto:bruce.ashfield@gmail.com" target="_blank" rel="noreferrer" moz-do-not-send="true" class="moz-txt-link-freetext">bruce.ashfield@gmail.com</a>]<br>
                -=-=-=-=-=-=-=-=-=-=-=-<br>
                <br>
              </blockquote>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------bp9rBevNTrh0ZF01cRnHLosk--

