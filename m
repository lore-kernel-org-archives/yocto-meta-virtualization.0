Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6639.1625213470080444331
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 02 Jul 2021 01:11:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=YVTcoz/w;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2817940077=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1628B9S9021636;
	Fri, 2 Jul 2021 08:11:09 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2049.outbound.protection.outlook.com [104.47.57.49])
	by mx0a-0064b401.pphosted.com with ESMTP id 39hack8w6q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Jul 2021 08:11:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mwTnnD39ILgM3nU6K9CMEoZeXwiSGEqawNebho/5bHju334Z0z5ZDqJ0ez9Kq7VMdMUzQSveaMRQVvh65ZiLCf7kp8yciqPA5/j5tFQt9pSRS410PrCC0v9bP2RzJ2+gPpt2Sva7XrZ0NHzsMBaWRQVbX2X0n885ByN/wajY//9e7YZbh+hN/0o4bGmTsnovE+JCJ2p6WDPm//DtmRqRd6kjyWZTfGToN/SGqFROA380XrhBn/4GBDDaOKHnhvKqTW/avqYqsb7VpdtRinosZCfhOTBgdX0r/S6N2y4l2p74B9w+c3UJqIkDDwFblbwOqi73pJidZ5Th3P3XR8dKnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9pVSbm8sblHCtrWpxDAKtO91o0UVTLjdviCMUMwtO2s=;
 b=YDomc09MquzdaI2XPZxKzEs0kVYJjZWH/IIuzK0d3eF5LaCcm+ixlRC6hXzQItN3aB1InUeexbqDuzXxTXH2N2617fnnlb8aTTQmUAjGwxU5Fw/WBG9405cI6q6wFVyNjfG3A0AreeSLEqAXLbVI1ZQ4TGOPKGszF27om2msxRy0VludVHWEFAM0V8yBLaZH0GBGoz8518O39BZdCU+PBW/E4TuNVNq8JaGm1pkGwjVVpFFTeKNAiaIN0UGwU7hNAy3oMVusY9IDzq62smlgWtqQVsuDmVB6o8fPHisK/cqRGeXTt2fnVu5Z8E1zHQt63v/JNb+9ZdhvExg4OelApQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9pVSbm8sblHCtrWpxDAKtO91o0UVTLjdviCMUMwtO2s=;
 b=YVTcoz/whsShLOfjYOUrRYaggf3RI9JWqVAjSaesLzt29qzykidt+ETYpwZq8Pa7G97RzdCR5pLQ+uTy+2ApOT8zzZhk4BkAi+FRjb6Jr+ta1SJmtL+Pc/HYtgiYUx8ys6ROT9E0ZJsteUrQbM1DyhIrHCgnrGKYQ4y8RwzXMT4=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from MW3PR11MB4633.namprd11.prod.outlook.com (2603:10b6:303:5b::9)
 by MWHPR11MB1823.namprd11.prod.outlook.com (2603:10b6:300:10e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Fri, 2 Jul
 2021 08:11:07 +0000
Received: from MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::88f1:33f5:b8e0:f23a]) by MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::88f1:33f5:b8e0:f23a%3]) with mapi id 15.20.4264.026; Fri, 2 Jul 2021
 08:11:06 +0000
Subject: Re: [meta-virtualization][PATCH] umoci: rework recipe
From: "hongxu" <hongxu.jia@windriver.com>
To: meta-virtualization@lists.yoctoproject.org, bruce.ashfield@gmail.com
References: <168DEA6BA6D7C3F7.26864@lists.yoctoproject.org>
Message-ID: <9477d86d-e33d-d726-b0ee-2693e655e8bd@windriver.com>
Date: Fri, 2 Jul 2021 16:11:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <168DEA6BA6D7C3F7.26864@lists.yoctoproject.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0031.apcprd03.prod.outlook.com
 (2603:1096:203:c9::18) To MW3PR11MB4633.namprd11.prod.outlook.com
 (2603:10b6:303:5b::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.143] (60.247.85.82) by HKAPR03CA0031.apcprd03.prod.outlook.com (2603:1096:203:c9::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.8 via Frontend Transport; Fri, 2 Jul 2021 08:11:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9fe0d101-fe7a-4958-e083-08d93d30f159
X-MS-TrafficTypeDiagnostic: MWHPR11MB1823:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB18235B15305D5510BA32CF37941F9@MWHPR11MB1823.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qhDAAs3yt7UHII+CzcV0pOLRMRhqZd0CCLqRD2xULCc1AnP4En8Wq6J1ouAQzKHdwgNq+NyIeznJ67fs+71Bn00oT6QF89+4NNipkf278rBHhTnm7yuzYFf9mbfbOtflt4RX2g8qpRCat4mfhVSUdqigXDZRXS/RWf8KtE9EcY/DAI4LJa7II2dxIC/KIi8pXC/Sh3RF3oGQZXOw8Bk4E0kv5KsXNhc1iyTGbNK3FsyCqYKL3+sJH+iVAchR4hxIJ11VsbGtiVkLqF4r3Q28uDlTHkWcp+57NzoeuPeY+w+liHxDvdmYPtDLCsPGMM/dGdFRtFEfE+DpeKSRQNJeLNjArNoTQ9XGA6T9+kr7n+ueQp8y0ksRpbmkznq5PJ2wmdmBULfHmz5ADavl3O/2Og+yZZWiA3HzEe6peqAulRcLnGNIis0s/bHWNqu3zYuTAqMr67dwqfAmUMa9LtM26JYK0zxecGl8pzQyMSEQFjzMWKdo5dd7/JQ+H4mW+3gIkXeZ6h+H8hHIsPBGvALYRN91y9vzGkLXLClnLaFeeYkASGI7Wm8nZx5pAKm4YiQURmV4mX6etKHFKpkGD5c6l0boyMyCKGRw+UWSj81oA+g2Zcq5A8CBlCKscZIMlrEwQSRfAvkGj2jM4noZ73Y4E13TrD5JEMJGpVOl9CnsN0jHKKo1tOrvliNNICD9mW5k5nxy7zK2YLGhdwX7HFTL/j8BgvS6LHVm5xvICPMkezZ2AOSPFT92Dt+nEgM19ZJzl4mNorgZfh5vMktet1KA4nwqXLPoOfMNjGS4CL8nFEvE/uu8JqF3qY+wCBcY4ALIYwBRZBxetlGb3ijl//xcZ4DbvWCDIaCH9nx95KYN8jKi8P+xnnaPUALm8tmsFQ2njbhLkyPZXGN9YFUQb3NazrLvubQs+vptycSQGNnVisScecT6QaibXALkvc/gy9wZ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4633.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(366004)(39850400004)(376002)(16526019)(186003)(26005)(86362001)(66476007)(66556008)(38350700002)(31696002)(33964004)(38100700002)(8676002)(6486002)(31686004)(8936002)(52116002)(5660300002)(53546011)(30864003)(44832011)(478600001)(66946007)(2906002)(6666004)(166002)(83380400001)(36756003)(966005)(2616005)(956004)(316002)(16576012)(6706004)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bDRUakpIZ1B2cU5FUzhldmJGNk9HUE13bGJBKzRRa0tyQzhXbWlXUEk0TjBF?=
 =?utf-8?B?SC9FaUFVWEtRTjN6ODVUdndyMTRpSHZtTVBzMUZ1SEVBTUo0SXd0eEg5YVAw?=
 =?utf-8?B?Zk15SkZBcXEwdWt3aSt4TFhoYytsQ1ZPRTVXL3BlbTFnTnpXL01VSml6SkZz?=
 =?utf-8?B?T09tV2thRGpmc1VRbEFHVDdYL0prNDArWjJ1aDJJaW5zbVV2QmEzNkdKWTNP?=
 =?utf-8?B?aFRld21URnNMRVMwVTIrZXFzaEtzOEdIN0UyTGNYbHRSMFJ3bVZrRVo4N1pM?=
 =?utf-8?B?anlncVc2NmxubUtQRGFjNjdTM01vTkFhT1dpUW9lR3BTSHJ5VDFRWjNVUXhR?=
 =?utf-8?B?QTd4aFBqSlBkL242WkJiNDN0YXNmQzF6NzVrTHZqUmlmSUxkY3lESFZ6elBH?=
 =?utf-8?B?dFluOXp5RlNpdUpZWWo1RUpZTWhqMHc4T1BvMFhienl5WWRhWi9iQU54NmZB?=
 =?utf-8?B?bG9qbmNyK3FPMHJQL2RkV0xsQjBxNFBHaHhkM1VTN3RJQmMrOVJxaTY0bDVV?=
 =?utf-8?B?SFR2WWtKTmx4UDJ4aXNsR1ZlMG5QbFNhSWhLTG9ZNEtlb2dIMlhPWlJ2ZzBB?=
 =?utf-8?B?azFTV3orQ2tlU0EzVExJTXZUVXJiRE1PcVcyRjdVOHhNaFFOOFlUNUFYNW9H?=
 =?utf-8?B?a0tqYTFkQVJEWU5wWnRYZVAxRDZmZ2Erdi9XQ3VNS2dJYS91N0FZVzJLcjJ6?=
 =?utf-8?B?cGs5aU1oWGVPWXp3UXZOS0xGU3Y1c3o4SVM1emNKTHB2ckVEeUM3a0Q2N2dp?=
 =?utf-8?B?VXNmUEY3ZlZ6MU55aldNVmtsZkdycGd4L2pYL1QwMnpnQWVaaDFSN1ZNUjVK?=
 =?utf-8?B?c0JCcENPVnp3eUs5WWtyZDc3TW5KUDlCdDhTZzJmWkRWU201ODJTRGxHTDR5?=
 =?utf-8?B?UTJ5M1BsMXpIa0wvZHlCbXBZaFMzNEc5YzVWSW1VYmlKWjdBTmlxdVhzZitq?=
 =?utf-8?B?OENZdWVoRThIV1dxaDFMUlk3UHQ2SHNVWlJwVmhhVmt0MXNqWlNkWFcxVGVW?=
 =?utf-8?B?UUc1czBPekkxQTNtL0ZqcUt1Lzd2YW1GS0JxdHNUeG9EZ3RrbGdpdmFTUXFH?=
 =?utf-8?B?bmhrVmhLVHo1bkhVRTRXTWVWdWlzRTlIcFlwYjVQOXBCZ3NWWUFsb29WWnZB?=
 =?utf-8?B?Nll2NnNUVEFGa1ZXNTByZDlOMnIxQjhzdnhEaWduNW0xNm1JQ3o1bU1BaHVj?=
 =?utf-8?B?VW91c2RTTEd0T1pKV0VFcWRsVDRrY0x5eU1hVjkxOHh1NE9IQ0RmUk5KYXVm?=
 =?utf-8?B?aDFRMHFnMEd3Mis5YlRIZHRwQ2RHUm9PNit4UThnZEFwQnUvcklveTFGMWlz?=
 =?utf-8?B?WmNnTkdSTEJseW1PSC9SWEtGdmNMejEyWnA1d3Q3ak03WXZJR3JOS1JaTFhi?=
 =?utf-8?B?MXUwcmJRdyt0aVVic0pRMzYyM1NqSi9RUGUveFc2RHlBNWZXUFg5UWxHUGxo?=
 =?utf-8?B?c1JoOFhDcDhyT2FBby9mYnMzSTNvZXBCcjBLQXBYcnhLRG41Vkx1b0IrZVhX?=
 =?utf-8?B?SXZIb2VEV3BKcHBLNHM3SU9oc3BjUWFBRVViKzlkamg4SEdySGF3SjBnMjlW?=
 =?utf-8?B?MVBMRkdlbll4Mm81N1F2Ky9MQi9FMkVpWHhxckNGdFpPbVQ1N2FBNTdkVUlz?=
 =?utf-8?B?RENva0c4KzRrN2FlN29wYU9XcTY5d2piVHdHakFWbDc1c2RaUytLWjE4U3cz?=
 =?utf-8?B?dS80aG1CdUNWcTVEdW5RbVhaN0xVWFlBLzI3T0xqNnowSGxIOVdzby8ycXNU?=
 =?utf-8?Q?+7cL+q/965wxzJIjOwQtqrwEjzNT9Dx8hfIRg+K?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fe0d101-fe7a-4958-e083-08d93d30f159
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2021 08:11:06.8331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TignylCxmfJkULxDXL6h9x3mDf+es8I/LEBCxyXtB5sQQuX7UkyOCFYHLcADjorNe0NsL4omL5jOme9BiuEMymTlSHjbWkOIJUvKhvKZIKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1823
X-Proofpoint-ORIG-GUID: wv-wxKaPyrP1led6c1cbCJzPNdrOSx4Y
X-Proofpoint-GUID: wv-wxKaPyrP1led6c1cbCJzPNdrOSx4Y
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-02_01:2021-07-01,2021-07-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 bulkscore=0 clxscore=1011 adultscore=0 impostorscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107020046
Content-Type: multipart/alternative;
 boundary="------------46A84DFAB8BE109FD5524EC4"
Content-Language: en-US

--------------46A84DFAB8BE109FD5524EC4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 1628B9S9021636

On 7/2/21 3:59 PM, hongxu wrote:
> 1. tweak homepage
>
> 2. Use go_do_compile of go bbclass in oe-core to replace
>     the do_compile in recipe, variables such as LD,CC,
>     CFLAGS, CGO_CFLAGS will be set automatically
>
> 3. Use go_do_install of go bbclass in oe-core to replace
>     the do_install in recipe, all necessary will be installed
>
> 4. export GO111MODULE=3Doff globally
>
> 5. Skip file-rdeps insane for umoci dev packages since scripts
>     in umoci dev packages contains awk, bash shebang
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   recipes-containers/umoci/umoci_git.bb | 75 ++++-----------------------
>   1 file changed, 10 insertions(+), 65 deletions(-)
>
> diff --git a/recipes-containers/umoci/umoci_git.bb b/recipes-containers/=
umoci/umoci_git.bb
> index f83a35a7..c4007eb3 100644
> --- a/recipes-containers/umoci/umoci_git.bb
> +++ b/recipes-containers/umoci/umoci_git.bb
> @@ -1,80 +1,25 @@
> -HOMEPAGE =3D "https://github.com/openSUSE/umoci"
> +HOMEPAGE =3D "https://umo.ci"
>   SUMMARY =3D "umoci modifies Open Container images"
>   LICENSE =3D "Apache-2.0"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3b83ef96387f14655fc854ddc3c6=
bd57"
> +LIC_FILES_CHKSUM =3D "file://src/${GO_IMPORT}/COPYING;md5=3D3b83ef96387=
f14655fc854ddc3c6bd57"
>  =20
>   RDEPENDS_${PN} =3D "skopeo"
>   RDEPENDS_${PN}_class-native =3D ""
>  =20
> -SRCREV_umoci =3D "758044fc26ad65eb900143e90d1e22c2d6e4484d"
> -SRC_URI =3D "git://github.com/opencontainers/umoci.git;branch=3Dmaster;=
name=3Dumoci;destsuffix=3Dgithub.com/opencontainers/umoci \
> -          "
> +SRCREV =3D "758044fc26ad65eb900143e90d1e22c2d6e4484d"
> +SRC_URI =3D " \
> +    git://${GO_IMPORT}; \
> +"
>  =20
>   PV =3D "v0.4.7-dev+git${SRCPV}"
> -S =3D "${WORKDIR}/github.com/opencontainers/umoci"
> +S =3D "${WORKDIR}/git"
>   GO_IMPORT =3D "github.com/opencontainers/umoci"
>  =20
>   inherit goarch
>   inherit go
>  =20
> -# This disables seccomp and apparmor, which are on by default in the
> -# go package.
> -EXTRA_OEMAKE=3D"BUILDTAGS=3D''"
> +export GO111MODULE=3D"off"
>  =20
> -
> -do_compile_class-native () {
> -    export GOARCH=3D"${BUILD_GOARCH}"
> -
> -    # Pass the needed cflags/ldflags so that cgo can find the needed he=
aders files and libraries
> -    export CGO_ENABLED=3D"1"
> -    export CFLAGS=3D"${BUILD_CFLAGS}"
> -    export LDFLAGS=3D"${BUILD_LDFLAGS}"
> -    export CGO_CFLAGS=3D"${BUILD_CFLAGS}"
> -
> -    # as of go 1.15.5, there are some flags the CGO doesn't like. Rathe=
r than
> -    # clearing them all, we sed away the ones we don't want.
> -    # export CGO_LDFLAGS=3D"$(echo ${BUILD_LDFLAGS} | sed 's/-Wl,-O1//g=
' | sed 's/-Wl,--dynamic-linker.*?( \|$\)//g')"
> -    export CC=3D"${BUILD_CC}"
> -    export LD=3D"${BUILD_LD}"
> -
> -    export GOPATH=3D"${WORKDIR}/git/"
> -    export GO111MODULE=3Doff
> -
> -    cd ${S}
> -
> -    # why static ? patchelf will be run on dynamic binaries and it brea=
ks
> -    # the executable (coredump)
> -    # https://forum.snapcraft.io/t/patchelf-broke-my-binary/4928
> -    # https://github.com/NixOS/patchelf/issues/146
> -    oe_runmake umoci.static
> -

Hi Bruce,

About native umoci, I've no idea about the patchelf testing, I directly=20
run native umoci -h in my build

...

$=20
image/buildarea/raid5/hjia/wrlinux-20/lat_deb_061621/build-binary/tmp-glib=
c/work/x86_64-linux/umoci-native/0.4.6-r0/recipe-sysroot-native/usr/bin/umo=
ci=20
-h
NAME:
 =C2=A0=C2=A0 umoci - umoci modifies Open Container images

USAGE:
 =C2=A0=C2=A0 umoci [global options] command [command options] [arguments.=
..]

VERSION:
 =C2=A0=C2=A0 unknown

AUTHOR:
 =C2=A0=C2=A0 Aleksa Sarai <asarai@suse.com>

COMMANDS:
 =C2=A0=C2=A0 raw=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 advanced internal image to=
oling
 =C2=A0=C2=A0 help, h=C2=A0 Shows a list of commands or help for one comma=
nd

 =C2=A0=C2=A0 image:
 =C2=A0=C2=A0=C2=A0=C2=A0 config=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 modifies th=
e image configuration of an OCI image
 =C2=A0=C2=A0=C2=A0=C2=A0 unpack=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unpacks a r=
eference into an OCI runtime bundle
 =C2=A0=C2=A0=C2=A0=C2=A0 repack=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 repacks an =
OCI runtime bundle into a reference
 =C2=A0=C2=A0=C2=A0=C2=A0 new=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0 creates a blank tagged OCI image
 =C2=A0=C2=A0=C2=A0=C2=A0 tag=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0 creates a new tag in an OCI image
 =C2=A0=C2=A0=C2=A0=C2=A0 remove, rm=C2=A0 removes a tag from an OCI image
 =C2=A0=C2=A0=C2=A0=C2=A0 stat=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d=
isplays status information of an image manifest
 =C2=A0=C2=A0=C2=A0=C2=A0 insert=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 insert cont=
ent into an OCI image

 =C2=A0=C2=A0 layout:
 =C2=A0=C2=A0=C2=A0=C2=A0 gc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gar=
bage-collects an OCI image's blobs
 =C2=A0=C2=A0=C2=A0=C2=A0 init=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 create a new =
OCI layout
 =C2=A0=C2=A0=C2=A0=C2=A0 list, ls=C2=A0 lists the set of tags in an OCI l=
ayout

GLOBAL OPTIONS:
 =C2=A0=C2=A0 --verbose=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 alias for --log=3Din=
fo
 =C2=A0=C2=A0 --log value=C2=A0=C2=A0=C2=A0 set the log level (debug, info=
, [warn], error, fatal)=20
(default: "warn")
 =C2=A0=C2=A0 --help, -h=C2=A0=C2=A0=C2=A0=C2=A0 show help
 =C2=A0=C2=A0 --version, -v=C2=A0 print the version

...

//Hongxu

> -    # so the common install can find our binary
> -    cp umoci.static umoci
> -}
> -
> -do_compile() {
> -    export GOARCH=3D"${TARGET_GOARCH}"
> -    export GOPATH=3D"${WORKDIR}/git/"
> -
> -    # Pass the needed cflags/ldflags so that cgo
> -    # can find the needed headers files and libraries
> -    export CGO_ENABLED=3D"1"
> -    export CFLAGS=3D""
> -    export LDFLAGS=3D""
> -    export CGO_CFLAGS=3D"${BUILDSDK_CFLAGS} --sysroot=3D${STAGING_DIR_T=
ARGET}"
> -    export CGO_LDFLAGS=3D"${BUILDSDK_LDFLAGS} --sysroot=3D${STAGING_DIR=
_TARGET}"
> -
> -    export GO111MODULE=3Doff
> -
> -    cd ${S}
> -
> -    oe_runmake umoci
> -}
> -
> -do_install() {
> -    install -d ${D}/${sbindir}
> -    install ${S}/umoci ${D}/${sbindir}
> -}
> -
> -INSANE_SKIP_${PN} +=3D "ldflags already-stripped"
> +INSANE_SKIP_${PN}-dev +=3D "file-rdeps"
> +INSANE_SKIP_${PN} +=3D "already-stripped"
>   BBCLASSEXTEND =3D "native nativesdk"
>
>=20
>


--------------46A84DFAB8BE109FD5524EC4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 7/2/21 3:59 PM, hongxu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:168DEA6BA6D7C3F7.26864@lists.yoctoproject.org">
      <pre class="moz-quote-pre" wrap="">1. tweak homepage

2. Use go_do_compile of go bbclass in oe-core to replace
   the do_compile in recipe, variables such as LD,CC,
   CFLAGS, CGO_CFLAGS will be set automatically

3. Use go_do_install of go bbclass in oe-core to replace
   the do_install in recipe, all necessary will be installed

4. export GO111MODULE=off globally

5. Skip file-rdeps insane for umoci dev packages since scripts
   in umoci dev packages contains awk, bash shebang

Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
---
 recipes-containers/umoci/umoci_git.bb | 75 ++++-----------------------
 1 file changed, 10 insertions(+), 65 deletions(-)

diff --git a/recipes-containers/umoci/umoci_git.bb b/recipes-containers/umoci/umoci_git.bb
index f83a35a7..c4007eb3 100644
--- a/recipes-containers/umoci/umoci_git.bb
+++ b/recipes-containers/umoci/umoci_git.bb
@@ -1,80 +1,25 @@
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/openSUSE/umoci">&quot;https://github.com/openSUSE/umoci&quot;</a>
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://umo.ci">&quot;https://umo.ci&quot;</a>
 SUMMARY = &quot;umoci modifies Open Container images&quot;
 LICENSE = &quot;Apache-2.0&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57">&quot;file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://src/${GO_IMPORT}/COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57">&quot;file://src/${GO_IMPORT}/COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57&quot;</a>
 
 RDEPENDS_${PN} = &quot;skopeo&quot;
 RDEPENDS_${PN}_class-native = &quot;&quot;
 
-SRCREV_umoci = &quot;758044fc26ad65eb900143e90d1e22c2d6e4484d&quot;
-SRC_URI = &quot;git://github.com/opencontainers/umoci.git;branch=master;name=umoci;destsuffix=github.com/opencontainers/umoci \
-          &quot;
+SRCREV = &quot;758044fc26ad65eb900143e90d1e22c2d6e4484d&quot;
+SRC_URI = &quot; \
+    git://${GO_IMPORT}; \
+&quot;
 
 PV = &quot;v0.4.7-dev+git${SRCPV}&quot;
-S = &quot;${WORKDIR}/github.com/opencontainers/umoci&quot;
+S = &quot;${WORKDIR}/git&quot;
 GO_IMPORT = &quot;github.com/opencontainers/umoci&quot;
 
 inherit goarch
 inherit go
 
-# This disables seccomp and apparmor, which are on by default in the
-# go package. 
-EXTRA_OEMAKE=&quot;BUILDTAGS=''&quot;
+export GO111MODULE=&quot;off&quot;
 
-
-do_compile_class-native () {
-    export GOARCH=&quot;${BUILD_GOARCH}&quot;
-
-    # Pass the needed cflags/ldflags so that cgo can find the needed headers files and libraries
-    export CGO_ENABLED=&quot;1&quot;
-    export CFLAGS=&quot;${BUILD_CFLAGS}&quot;
-    export LDFLAGS=&quot;${BUILD_LDFLAGS}&quot;
-    export CGO_CFLAGS=&quot;${BUILD_CFLAGS}&quot;
-
-    # as of go 1.15.5, there are some flags the CGO doesn't like. Rather than
-    # clearing them all, we sed away the ones we don't want.
-    # export CGO_LDFLAGS=&quot;$(echo ${BUILD_LDFLAGS} | sed 's/-Wl,-O1//g' | sed 's/-Wl,--dynamic-linker.*?( \|$\)//g')&quot;
-    export CC=&quot;${BUILD_CC}&quot;
-    export LD=&quot;${BUILD_LD}&quot;
-
-    export GOPATH=&quot;${WORKDIR}/git/&quot;
-    export GO111MODULE=off
-
-    cd ${S}
-
-    # why static ? patchelf will be run on dynamic binaries and it breaks
-    # the executable (coredump)
-    # <a class="moz-txt-link-freetext" href="https://forum.snapcraft.io/t/patchelf-broke-my-binary/4928">https://forum.snapcraft.io/t/patchelf-broke-my-binary/4928</a>
-    # <a class="moz-txt-link-freetext" href="https://github.com/NixOS/patchelf/issues/146">https://github.com/NixOS/patchelf/issues/146</a>
-    oe_runmake umoci.static
-</pre>
    </blockquote>
    <p>Hi Bruce,</p>
    <p>About native umoci, I've no idea about the patchelf testing, I
      directly run native umoci -h in my build<br>
    </p>
    <p>...<br>
    </p>
    <p>$
image/buildarea/raid5/hjia/wrlinux-20/lat_deb_061621/build-binary/tmp-glibc/work/x86_64-linux/umoci-native/0.4.6-r0/recipe-sysroot-native/usr/bin/umoci
      -h<br>
      NAME:<br>
      &nbsp;&nbsp; umoci - umoci modifies Open Container images<br>
      <br>
      USAGE:<br>
      &nbsp;&nbsp; umoci [global options] command [command options] [arguments...]<br>
      <br>
      VERSION:<br>
      &nbsp;&nbsp; unknown<br>
      <br>
      AUTHOR:<br>
      &nbsp;&nbsp; Aleksa Sarai <a class="moz-txt-link-rfc2396E" href="mailto:asarai@suse.com">&lt;asarai@suse.com&gt;</a><br>
      <br>
      COMMANDS:<br>
      &nbsp;&nbsp; raw&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; advanced internal image tooling<br>
      &nbsp;&nbsp; help, h&nbsp; Shows a list of commands or help for one command<br>
      <br>
      &nbsp;&nbsp; image:<br>
      &nbsp;&nbsp;&nbsp;&nbsp; config&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; modifies the image configuration of an OCI image<br>
      &nbsp;&nbsp;&nbsp;&nbsp; unpack&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unpacks a reference into an OCI runtime bundle<br>
      &nbsp;&nbsp;&nbsp;&nbsp; repack&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; repacks an OCI runtime bundle into a reference<br>
      &nbsp;&nbsp;&nbsp;&nbsp; new&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; creates a blank tagged OCI image<br>
      &nbsp;&nbsp;&nbsp;&nbsp; tag&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; creates a new tag in an OCI image<br>
      &nbsp;&nbsp;&nbsp;&nbsp; remove, rm&nbsp; removes a tag from an OCI image<br>
      &nbsp;&nbsp;&nbsp;&nbsp; stat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; displays status information of an image manifest<br>
      &nbsp;&nbsp;&nbsp;&nbsp; insert&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; insert content into an OCI image<br>
      <br>
      &nbsp;&nbsp; layout:<br>
      &nbsp;&nbsp;&nbsp;&nbsp; gc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; garbage-collects an OCI image's blobs<br>
      &nbsp;&nbsp;&nbsp;&nbsp; init&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create a new OCI layout<br>
      &nbsp;&nbsp;&nbsp;&nbsp; list, ls&nbsp; lists the set of tags in an OCI layout<br>
      <br>
      GLOBAL OPTIONS:<br>
      &nbsp;&nbsp; --verbose&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alias for --log=info<br>
      &nbsp;&nbsp; --log value&nbsp;&nbsp;&nbsp; set the log level (debug, info, [warn], error,
      fatal) (default: &quot;warn&quot;)<br>
      &nbsp;&nbsp; --help, -h&nbsp;&nbsp;&nbsp;&nbsp; show help<br>
      &nbsp;&nbsp; --version, -v&nbsp; print the version</p>
    <p>...</p>
    <p>//Hongxu<br>
    </p>
    <blockquote type="cite" cite="mid:168DEA6BA6D7C3F7.26864@lists.yoctoproject.org">
      <pre class="moz-quote-pre" wrap="">
-    # so the common install can find our binary
-    cp umoci.static umoci
-}
-
-do_compile() {
-    export GOARCH=&quot;${TARGET_GOARCH}&quot;
-    export GOPATH=&quot;${WORKDIR}/git/&quot;
-
-    # Pass the needed cflags/ldflags so that cgo
-    # can find the needed headers files and libraries
-    export CGO_ENABLED=&quot;1&quot;
-    export CFLAGS=&quot;&quot;
-    export LDFLAGS=&quot;&quot;
-    export CGO_CFLAGS=&quot;${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_TARGET}&quot;
-    export CGO_LDFLAGS=&quot;${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}&quot;
-
-    export GO111MODULE=off
-
-    cd ${S}
-
-    oe_runmake umoci
-}
-
-do_install() {
-    install -d ${D}/${sbindir}
-    install ${S}/umoci ${D}/${sbindir}
-}
-
-INSANE_SKIP_${PN} += &quot;ldflags already-stripped&quot;
+INSANE_SKIP_${PN}-dev += &quot;file-rdeps&quot;
+INSANE_SKIP_${PN} += &quot;already-stripped&quot;
 BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------46A84DFAB8BE109FD5524EC4--
