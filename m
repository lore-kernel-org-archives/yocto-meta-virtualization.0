Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E94C4167D
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 12:23:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.25863.1699619025678545815
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Nov 2023 04:23:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Gj/xIfO4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9678ab8c22=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AABiV6Y011403;
	Fri, 10 Nov 2023 04:23:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=PPS06212021; bh=cnhCjehrwo86FNbRf3
	nwadwf8dCcG1qCtAEEktkTOTc=; b=Gj/xIfO4VQmC3+tKauBkI9i8fRb93N6Ar8
	pFNRXU6DuHh60icB2j5afmZV6kKexb/5HJTpvZtVxtI+tjl6cthfs4FKAwihXphO
	hRv6+WAZ7nBp7eqt3pHJYkoAufCyu6GrOavSjfWreEggx0p96wKTfVA0MeMKURxb
	KpxqksOBEMJfr6f7G92YVzvHy1AU26rolM44f6e5A5d7niPyOgWvJeeqhhera2SI
	P+jYXSpTWCzKsmbRwgifCDmTNN0Xc6MwxKSFgYBpsOG8d+iQ71FGmpjvmE7ex5gk
	wwzjSXWyuPCDh/Cl/yixZmI3B8E8kIdnqFY5zPqPE5XOGawM5+uw==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u7w2sk1w4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Nov 2023 04:23:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QJi4HGCN9hl1oRnl2Nu5q+CJCb17S1tkBoIEDajKcdS8A0mnT3KTrWTYisAq4ALPWktlMUhLViJsC7272p5xPjTaI5GJlKMZ/NtpY8Wjoo0JPL3vUVwQbBRZk2wSf5xnb4unn4yAgNox0pyfiOr7EFAfEhD0GKpLA4PZb+VslkTXBVN3zOCmSD8wTwwZ9aT3Z0hhCuE7umBOFou5lfM/B9zRGrfGL2SbplOd77htj2fA+l3cC6UlJEeHHVmvlDwiwGopxl1+csBh9O6iP9oU5mc4oKO2Z1ZRYDN6rBgYNvvrzg/HlDe9LiOTNwHa96dXsyHNFTf4xTZqadJSgrYpSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cnhCjehrwo86FNbRf3nwadwf8dCcG1qCtAEEktkTOTc=;
 b=f3ObmmPdIuJu8P+iqpDdLaDg6qpCEkBVZPFvvAGBCz+bkxaglYy2CDirMe044SuOdkRVUSoE1b1wqd7NfMV1QlAVsyIvzqFUxZLboSB62HSMNOE6zqTP7bLTpOgUd7mO50Uyi85aNSymrKZoP6D6HRPuK1wBwGVe8wAVSA6kVsiJ5e0lsXt0EZjIUl2Y7aG8QHygL47BPLq2auRWzN2XqnGVUfkOAuVPQ6sUDWEOCNT18/SylDjV2nGlP48OXlA+FGdWnoPo/AXzgYWccYBDQCkVjXLBVi+mKGzavxGpvKmAywZ3sFwVkHAsdounxBRNgZbedmcLVANvEXpqeviAyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3404.namprd11.prod.outlook.com (2603:10b6:5:59::29) by
 PH0PR11MB5628.namprd11.prod.outlook.com (2603:10b6:510:d4::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.19; Fri, 10 Nov 2023 12:23:38 +0000
Received: from DM6PR11MB3404.namprd11.prod.outlook.com
 ([fe80::e961:59a4:5e18:43d0]) by DM6PR11MB3404.namprd11.prod.outlook.com
 ([fe80::e961:59a4:5e18:43d0%2]) with mapi id 15.20.6954.029; Fri, 10 Nov 2023
 12:23:38 +0000
From: "Sambu, Soumya" <Soumya.Sambu@windriver.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization][kirkstone][PATCH 1/1] kubernetes: Adjust
 patches to resolve error that occur with devtool
Thread-Topic: [meta-virtualization][kirkstone][PATCH 1/1] kubernetes: Adjust
 patches to resolve error that occur with devtool
Thread-Index: AQHaER2ICB2LglYqVE+A0fMBHd6AiLBzeSJH
Date: Fri, 10 Nov 2023 12:23:38 +0000
Message-ID: 
 <DM6PR11MB3404FC3F43CD7267ECFE886881AEA@DM6PR11MB3404.namprd11.prod.outlook.com>
References: <20231102130805.1285325-1-soumya.sambu@windriver.com>
 <ZUmZHuThmfjqR7XR@gmail.com>
In-Reply-To: <ZUmZHuThmfjqR7XR@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3404:EE_|PH0PR11MB5628:EE_
x-ms-office365-filtering-correlation-id: c2ee11d6-848d-4e8c-5959-08dbe1e7de11
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 1ptoqKxYoMlFpPHM9OVJLd8Qy7+w05+trAGWPiOpkv0gkKrnFGigIHu/CU5pZ1uH+gELAfQc4wRR/ZAjvXKgQn9HfLFIqJZ7pdTDITqEtcmYozeswO3wwOluniSLl2iDmeC1NiHaTWtXwQWZb2vOtosi8uGxahpJ0DZgHtFGwqmtJhSbILaNBW11vn917ngwlJdCZQ5k9Ihxrtyo/Pos1M60t3pryyoduZCy/VhBgUfsMPoRsHgf3ixI0P9R8lhSQ/JkOmimIt71efs2lgNxowUThG99nXP1JUVsvIS80pai1fIB4BWsQd6BB6CAzux6Ann57amHvmDbKfaLZXsd3LIzDxgQ/fSzKStvRYXwUuoxWbRDTvp6P84dCs6W2iA7MQozeqhfWp4cmpALo6TLi3iyJMxflrcRQJlTFIEyhqgRfz9HDF37WhmxfpNhlfPnxRjswayChoAr2g5rUPtnjcSLEgwdkI/aG+zOSYcKLxt7YiP1y47Gan/pP+wgsbzndut3y+qhBs+QqRCSWvZ2q64Rxc0jfEkF7MIwA5alZ8nYKaIK8jgh3FsZYDPf2r6kWYY8d5tVNtfyuPnaIrgNVqQuG9ZXzv8ERNUtc9KMadxjZB3JM1E+v6NSLIqu1g8T7PqFj1s0C+WPdCyHF3Tb2iySpijZqL2PAlh3cS/xzDuhqGaN+47uX51tcmOHfKB3
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3404.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(346002)(39850400004)(396003)(230922051799003)(230273577357003)(230173577357003)(186009)(1800799009)(451199024)(64100799003)(33656002)(66899024)(38070700009)(8936002)(83380400001)(316002)(26005)(66446008)(66476007)(6916009)(64756008)(91956017)(76116006)(66946007)(30864003)(66556008)(2906002)(966005)(52536014)(4326008)(55016003)(84970400001)(5660300002)(478600001)(53546011)(8676002)(71200400001)(6506007)(7696005)(9686003)(19627405001)(122000001)(166002)(38100700002)(86362001)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?yLXlbDNJOG9c/GA1qzKklEsnFEWP1FVc+/H7kZwuw7VSIaPd/PKAQ0Rd5lSf?=
 =?us-ascii?Q?20YB1V8SE+Asiy9x0vhNaq71rTgATBVLHi66355oKI5V/BdNJm3PHMmP8y9i?=
 =?us-ascii?Q?5qTooLJxX7SbH0/5SjyFn7Zy9EzrXL9x4QLtGRi+XNzR5vWpLxE0Wlg3h+OO?=
 =?us-ascii?Q?EGCNuCfy7QxfPhdUgJInFrMOD4hAJUaG43loOzYxo6cpdfCCm9FRTtCupaGf?=
 =?us-ascii?Q?0ceEQ5KsiZjz8eYrQfLioiAxnBujnpbK70MjOf0N1y6O3DPLp4x/c8yiT3Kk?=
 =?us-ascii?Q?ylU/vP9Zr3Z8QRGQxgoDbZBGwFgPlxXsE6lMUUajmDrj8PEmrqojl9PaDxCa?=
 =?us-ascii?Q?BW9gz2cxrJ/AjT/BD+g8l3MnTsYaCk6qO/x5UYUTbn05McqxD0OgXfdMZM1U?=
 =?us-ascii?Q?X1qMHP0o2uLtdTo8oEAjNIOcWNI5o1v8cSpjbJnrLrLx6tPScDxf1B7a3POI?=
 =?us-ascii?Q?eB05NerbM6quDiItrZ46jHPFy5E6IcMW2sOc39OAaU5rjeZ5beJatcqiWM1+?=
 =?us-ascii?Q?8g+6eEjE71w1PNruTQ9hutZ/urkqQPQOXPLzQXI5kkUa9T6TN89mmg0MURDV?=
 =?us-ascii?Q?Nu5n9MZcebiATTNGDrsadmhU7lMIr6IuCvf4zJy5j+qnM8y2INsiJqfYYl6T?=
 =?us-ascii?Q?rxXAbw4Po6Np7BFnqUaQA/m67FR7xCpTjv6MbxGo963IpcRcPKntefoD9t6u?=
 =?us-ascii?Q?0mHOjt7zhP5rZtV3gF62mGAMEpJR1ak99/J3Re7LZbhziIm0duFGVheUzHRB?=
 =?us-ascii?Q?cR1xLVJfYGTyTPQzh82lBGchUQzTXE+G7ryooBx7FxIUiooi+4f2FcViqe4L?=
 =?us-ascii?Q?S8pf2uYwZLh2dJ+1FMZ3jGptAB5gbV507dSj30JqPGAHTCj/nvJhTqBw7kA3?=
 =?us-ascii?Q?jWYjPKvc2OpILAbXe22cTYn/FkPjIK4nvdSxLHQJ2CPkDIX1L3V/g5MJFgwB?=
 =?us-ascii?Q?VwScaZK2zapr8UrI1S5Fpd+1DgYFrnDX8efIkX0vVSuhTXEhA47SwwhrTv2m?=
 =?us-ascii?Q?8NxF5xcGYgW/cfZfLgV8dC4oDZ/jDQ/MIguwdXnaAg6d5XnOYzNVHHU7BArK?=
 =?us-ascii?Q?0T5TV0ZNoTLcPi1lzWPlKO5PrSbpTRthKMrRDwblBLMwoIkk0U/nZxfukMVV?=
 =?us-ascii?Q?bJpwz8U8YwcjBc4NgajmbV5CcyV21l/z6JNA7uk9keNBOxaHoYDfcFKx5PH+?=
 =?us-ascii?Q?5VbEKgsHPYhjZlaQetFuipd+mUlUPWzSuuLb0SQl23/ENrLJPt7Lyx2IaxlN?=
 =?us-ascii?Q?9gC01peOGqOJbWkManEOeoA7UfmT/tBpBTUHN5vqfuUswxZI4TKzAZFWXiTN?=
 =?us-ascii?Q?ROxwdypbLA/f/Qgu/tUS75nnE/PX6W1t/y8QgLgosz+CL3VBHTK/iCY2J2/c?=
 =?us-ascii?Q?KAn1f9hM+ONsxHYeZClTX8M2aHA7l+sX/yyD6pQN7DAx7OgOlzgVr/fEnGeB?=
 =?us-ascii?Q?xgXGmViKCH9TCFRf4mJSVBdpzXC2f8kKBBz80vTYaLKn/89AhnrMoSByFvNh?=
 =?us-ascii?Q?uKhgAP14peptcxWLMPayGwvZzwCq5c8WIwGZAB6HAjBR7Uz+yszpigV5U75B?=
 =?us-ascii?Q?cKse3lHyB5UgYc5Mtk8qDvCnn5lwj2HhXiwZbH3f?=
Content-Type: multipart/alternative;
	boundary="_000_DM6PR11MB3404FC3F43CD7267ECFE886881AEADM6PR11MB3404namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3404.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2ee11d6-848d-4e8c-5959-08dbe1e7de11
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 12:23:38.1987
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wk+N/12RfMnue3zJXel+vjRSe1Q49qwmy2arqSL7cKwK/lQ7XPrvEj9EDqIhXWi+Og2/DXN7yfbHhYVKdQ785qeXi75jhDKN8SrBgKQRNtY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5628
X-Proofpoint-GUID: Vr4kod4CWlRsdD4xn-_zkZTGLXjdHAiL
X-Proofpoint-ORIG-GUID: Vr4kod4CWlRsdD4xn-_zkZTGLXjdHAiL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_09,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311100101
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 10 Nov 2023 12:23:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8454

--_000_DM6PR11MB3404FC3F43CD7267ECFE886881AEADM6PR11MB3404namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

devtool issue is not seen on master branch, as it got fixed with commit -  =
https://git.yoctoproject.org/meta-virtualization/commit/?id=3Dd9af46db9aa90=
60c1ec10118b2cccabfc8264904
There are no TMPDIR references in kirkstone branch, hence above commit has =
not gone to kirkstone.

Do you want me to pick above commit on kirkstone to fix devtool issue or ca=
n I proceed with the changes that I have made?

Regards,
Soumya
________________________________
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Sent: Tuesday, November 7, 2023 7:25 AM
To: Sambu, Soumya <Soumya.Sambu@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists.y=
octoproject.org>
Subject: Re: [meta-virtualization][kirkstone][PATCH 1/1] kubernetes: Adjust=
 patches to resolve error that occur with devtool

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

In message: [meta-virtualization][kirkstone][PATCH 1/1] kubernetes: Adjust =
patches to resolve error that occur with devtool
on 02/11/2023 Soumya via lists.yoctoproject.org wrote:

> From: Soumya Sambu <soumya.sambu@windriver.com>
>
> Adjust patches and .bb to fix  below error which occurs with devtool modi=
fy command -
>
> ERROR: Applying patch '0001-hack-lib-golang.sh-use-CC-from-environment.pa=
tch' on
> target directory
> CmdError('sh -c \'PATCHFILE=3D"0001-hack-lib-golang.sh-use-CC-from-enviro=
nment.patch"
> git -c user.name=3D"OpenEmbedded" -c user.email=3D"oe.patch@oe" commit -F=
 /tmp/tmp_ptvioq3
> --author=3D"Koen Kooi <koen.kooi@linaro.org>"
> --date=3D"Mon, 23 Jul 2018 15:28:02 +0200"\'', 0, 'stdout: On branch devt=
ool
> Changes not staged for commit:
>   (use "git add <file>..." to update what will be committed)
>   (use "git restore <file>..." to discard changes in working directory)
>   (commit or discard the untracked or modified content in submodules)
> \tmodified:   src/import (modified content)
>
> no changes added to commit (use "git add" and/or "git commit -a")
>
> stderr: ')

The long log should also explain the change, not just what it
fixes.

In particular, indicate that devtool insists on working out of
a specific directory (${S} ?), and that hwe have to adjust the
paths of our patches to that directory structure, and also update
the recipe patch listing to be able to still apply the changes
during a build.

Also, does master have the same issue ? if so, we need to fix
it there first.

>
> Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> ---
>  ...ed_files-Fix-race-issue-for-installi.patch | 20 +++++++++++--------
>  ...sh-convert-remaining-go-calls-to-use.patch | 18 +++++++++--------
>  ...1-cross-don-t-build-tests-by-default.patch | 12 ++++++-----
>  ...ib-golang.sh-use-CC-from-environment.patch | 14 ++++++++-----
>  .../kubernetes/kubernetes_git.bb              |  8 ++++----
>  5 files changed, 42 insertions(+), 30 deletions(-)
>
> diff --git a/recipes-containers/kubernetes/kubernetes/0001-Makefile.gener=
ated_files-Fix-race-issue-for-installi.patch b/recipes-containers/kubernete=
s/kubernetes/0001-Makefile.generated_files-Fix-race-issue-for-installi.patc=
h
> index 02bb5e91..e0ef04dc 100644
> --- a/recipes-containers/kubernetes/kubernetes/0001-Makefile.generated_fi=
les-Fix-race-issue-for-installi.patch
> +++ b/recipes-containers/kubernetes/kubernetes/0001-Makefile.generated_fi=
les-Fix-race-issue-for-installi.patch
> @@ -1,8 +1,8 @@
>  From 441df8a24a2c80e320f140b5d9bc352c7ce8a64a Mon Sep 17 00:00:00 2001
>  From: Robert Yang <liezhi.yang@windriver.com>
>  Date: Thu, 15 Oct 2020 07:27:35 +0000
> -Subject: [PATCH] src/import/build/root/Makefile.generated_files: Fix rac=
e issue for installing
> - go2make
> +Subject: [PATCH] src/import/build/root/Makefile.generated_files: Fix rac=
e
> + issue for installing go2make
>
>  The src/import/build/root/Makefile.generated_files are called several ti=
mes during the build, so the
>  following target which installs go2make will also run several times:
> @@ -24,15 +24,17 @@ problem.
>  Upstream-Status: Pending
>
>  Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> +
> +Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>

There's no need to add your Signed-Off-By here, there's no
changes in the the patch outside of context and line wrapping.

Same comment for all the patches that are being tweaked.

Cheers,

Bruce

>  ---
> - src/import/build/root/Makefile.generated_files | 4 +++-
> + build/root/Makefile.generated_files | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> -Index: kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630/sr=
c/import/build/root/Makefile.generated_files
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630.orig/=
src/import/build/root/Makefile.generated_files
> -+++ kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630/src/i=
mport/build/root/Makefile.generated_files
> -@@ -67,7 +67,9 @@
> +diff --git a/build/root/Makefile.generated_files b/build/root/Makefile.g=
enerated_files
> +index d86a90cbb39..19a3d332476 100644
> +--- a/build/root/Makefile.generated_files
> ++++ b/build/root/Makefile.generated_files
> +@@ -67,7 +67,9 @@ $(META_DIR)/$(GO_PKGDEPS_FILE): FORCE
>       if [[ "$(DBG_CODEGEN)" =3D=3D 1 ]]; then          \
>           echo "DBG: calculating Go dependencies";  \
>       fi
> @@ -43,3 +45,5 @@ Index: kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4=
d03e530d6f7630/src/import
>       hack/run-in-gopath.sh go2make                       \
>           k8s.io/kubernetes/...                           \
>           --prune  k8s.io/kubernetes/staging              \
> +--
> +2.40.0
> diff --git a/recipes-containers/kubernetes/kubernetes/0001-build-golang.s=
h-convert-remaining-go-calls-to-use.patch b/recipes-containers/kubernetes/k=
ubernetes/0001-build-golang.sh-convert-remaining-go-calls-to-use.patch
> index 8adbafb3..39fdac54 100644
> --- a/recipes-containers/kubernetes/kubernetes/0001-build-golang.sh-conve=
rt-remaining-go-calls-to-use.patch
> +++ b/recipes-containers/kubernetes/kubernetes/0001-build-golang.sh-conve=
rt-remaining-go-calls-to-use.patch
> @@ -4,15 +4,17 @@ Date: Wed, 12 Aug 2020 16:01:49 +0000
>  Subject: [PATCH] build/golang.sh: convert remaining 'go' calls to use
>
>  Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> +
> +Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
>  ---
>   hack/lib/golang.sh | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> -diff --git a/src/import/hack/lib/golang.sh b/src/import/hack/lib/golang.=
sh
> -index e9148ec08fa..71d3c987563 100755
> ---- a/src/import/hack/lib/golang.sh
> -+++ b/src/import/hack/lib/golang.sh
> -@@ -651,7 +651,7 @@ kube::golang::build_some_binaries() {
> +diff --git a/hack/lib/golang.sh b/hack/lib/golang.sh
> +index d0f4b00dadf..cef0c2075a3 100755
> +--- a/hack/lib/golang.sh
> ++++ b/hack/lib/golang.sh
> +@@ -654,7 +654,7 @@ kube::golang::build_some_binaries() {
>           kube::golang::create_coverage_dummy_test "${package}"
>           kube::util::trap_add "kube::golang::delete_coverage_dummy_test =
\"${package}\"" EXIT
>
> @@ -21,7 +23,7 @@ index e9148ec08fa..71d3c987563 100755
>             -covermode count \
>             -coverpkg k8s.io/...,k8s.io/kubernetes/vendor/k8s.io/... \
>             "${build_args[@]}" \
> -@@ -663,13 +663,13 @@ kube::golang::build_some_binaries() {
> +@@ -666,13 +666,13 @@ kube::golang::build_some_binaries() {
>       done
>       if [[ "${#uncovered[@]}" !=3D 0 ]]; then
>         V=3D2 kube::log::info "Building ${uncovered[*]} without coverage.=
.."
> @@ -37,7 +39,7 @@ index e9148ec08fa..71d3c987563 100755
>      fi
>   }
>
> -@@ -725,7 +725,7 @@ kube::golang::build_binaries_for_platform() {
> +@@ -730,7 +730,7 @@ kube::golang::build_binaries_for_platform() {
>       testpkg=3D$(dirname "${test}")
>
>       mkdir -p "$(dirname "${outfile}")"
> @@ -47,5 +49,5 @@ index e9148ec08fa..71d3c987563 100755
>         -gcflags "${gogcflags:-}" \
>         -asmflags "${goasmflags:-}" \
>  --
> -2.19.1
> +2.40.0
>
> diff --git a/recipes-containers/kubernetes/kubernetes/0001-cross-don-t-bu=
ild-tests-by-default.patch b/recipes-containers/kubernetes/kubernetes/0001-=
cross-don-t-build-tests-by-default.patch
> index 659e3013..26a9b726 100644
> --- a/recipes-containers/kubernetes/kubernetes/0001-cross-don-t-build-tes=
ts-by-default.patch
> +++ b/recipes-containers/kubernetes/kubernetes/0001-cross-don-t-build-tes=
ts-by-default.patch
> @@ -11,14 +11,16 @@ components without error. As such, we patch the targe=
ts out of the
>  script to allow a successful build.
>
>  Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> +
> +Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
>  ---
>   hack/make-rules/cross.sh | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> -diff --git a/src/import/hack/make-rules/cross.sh b/hack/make-rules/cross=
.sh
> -index 8e1e938..0898c5c 100755
> ---- a/src/import/hack/make-rules/cross.sh
> -+++ b/src/import/hack/make-rules/cross.sh
> +diff --git a/hack/make-rules/cross.sh b/hack/make-rules/cross.sh
> +index f8a6d0dbf5e..d22bf52b1cc 100755
> +--- a/hack/make-rules/cross.sh
> ++++ b/hack/make-rules/cross.sh
>  @@ -33,6 +33,6 @@ make all WHAT=3D"${KUBE_NODE_TARGETS[*]}" KUBE_BUILD_P=
LATFORMS=3D"${KUBE_NODE_PLATFO
>
>   make all WHAT=3D"${KUBE_CLIENT_TARGETS[*]}" KUBE_BUILD_PLATFORMS=3D"${K=
UBE_CLIENT_PLATFORMS[*]}"
> @@ -29,5 +31,5 @@ index 8e1e938..0898c5c 100755
>  -make all WHAT=3D"${KUBE_TEST_SERVER_TARGETS[*]}" KUBE_BUILD_PLATFORMS=
=3D"${KUBE_TEST_SERVER_PLATFORMS[*]}"
>  +#make all WHAT=3D"${KUBE_TEST_SERVER_TARGETS[*]}" KUBE_BUILD_PLATFORMS=
=3D"${KUBE_TEST_SERVER_PLATFORMS[*]}"
>  --
> -2.7.4
> +2.40.0
>
> diff --git a/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golan=
g.sh-use-CC-from-environment.patch b/recipes-containers/kubernetes/kubernet=
es/0001-hack-lib-golang.sh-use-CC-from-environment.patch
> index 3a22a2ef..d3b71aef 100644
> --- a/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-us=
e-CC-from-environment.patch
> +++ b/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-us=
e-CC-from-environment.patch
> @@ -7,15 +7,17 @@ Toolchain tupples differs, especially when using vendor=
 provides ones.
>
>  Upstream-status: Inappropriate [embedded specific]
>  Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> +
> +Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
>  ---
>   hack/lib/golang.sh | 4 ----
>   1 file changed, 4 deletions(-)
>
> -Index: kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630/sr=
c/import/hack/lib/golang.sh
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630.orig/=
src/import/hack/lib/golang.sh
> -+++ kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630/src/i=
mport/hack/lib/golang.sh
> -@@ -414,19 +414,15 @@
> +diff --git a/hack/lib/golang.sh b/hack/lib/golang.sh
> +index e16a60d1867..d0f4b00dadf 100755
> +--- a/hack/lib/golang.sh
> ++++ b/hack/lib/golang.sh
> +@@ -420,19 +420,15 @@ kube::golang::set_platform_envs() {
>           ;;
>         "linux/arm")
>           export CGO_ENABLED=3D1
> @@ -35,3 +37,5 @@ Index: kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4=
d03e530d6f7630/src/import
>           ;;
>       esac
>     fi
> +--
> +2.40.0
> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-co=
ntainers/kubernetes/kubernetes_git.bb
> index f475bd73..59892c92 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -26,10 +26,10 @@ SRC_URI =3D "git://github.com/kubernetes/kubernetes.g=
it;branch=3Drelease-1.23;name=3Dk
>             git://github.com/kubernetes/release;branch=3Dmaster;name=3Dku=
bernetes-release;destsuffix=3Dgit/release;protocol=3Dhttps"
>
>  SRC_URI:append =3D " \
> -           file://0001-hack-lib-golang.sh-use-CC-from-environment.patch =
\
> -           file://0001-cross-don-t-build-tests-by-default.patch \
> -           file://0001-build-golang.sh-convert-remaining-go-calls-to-use=
.patch \
> -           file://0001-Makefile.generated_files-Fix-race-issue-for-insta=
lli.patch \
> +           file://0001-hack-lib-golang.sh-use-CC-from-environment.patch;=
patchdir=3Dsrc/import \
> +           file://0001-cross-don-t-build-tests-by-default.patch;patchdir=
=3Dsrc/import \
> +           file://0001-build-golang.sh-convert-remaining-go-calls-to-use=
.patch;patchdir=3Dsrc/import \
> +           file://0001-Makefile.generated_files-Fix-race-issue-for-insta=
lli.patch;patchdir=3Dsrc/import \
>             file://cni-containerd-net.conflist \
>             file://k8s-init \
>             file://99-kubernetes.conf \
> --
> 2.40.0
>

>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8410): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8410
> Mute This Topic: https://lists.yoctoproject.org/mt/102341396/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--_000_DM6PR11MB3404FC3F43CD7267ECFE886881AEADM6PR11MB3404namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);">devtool issue is not seen on master branch, as i=
t got fixed with commit -&nbsp;
</span><span style=3D"letter-spacing: normal; font-family: Aptos, Aptos_Emb=
eddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: =
16px; font-weight: 400; color: rgb(0, 0, 0); background-color: rgb(255, 255=
, 255);"><a href=3D"https://git.yoctoproject.org/meta-virtualization/commit=
/?id=3Dd9af46db9aa9060c1ec10118b2cccabfc8264904" id=3D"LPlnk884345">https:/=
/git.yoctoproject.org/meta-virtualization/commit/?id=3Dd9af46db9aa9060c1ec1=
0118b2cccabfc8264904</a></span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">There are no TMPDIR references in kirkstone branch, hence above commit ha=
s not gone to kirkstone.</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);">Do you want me to pick above commit on kirkstone=
 to fix devtool issue or can I proceed
 with the changes that I have made?<br>
<br>
Regards,
<div>Soumya</div>
</span></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Bruce Ashfield &lt;br=
uce.ashfield@gmail.com&gt;<br>
<b>Sent:</b> Tuesday, November 7, 2023 7:25 AM<br>
<b>To:</b> Sambu, Soumya &lt;Soumya.Sambu@windriver.com&gt;<br>
<b>Cc:</b> meta-virtualization@lists.yoctoproject.org &lt;meta-virtualizati=
on@lists.yoctoproject.org&gt;<br>
<b>Subject:</b> Re: [meta-virtualization][kirkstone][PATCH 1/1] kubernetes:=
 Adjust patches to resolve error that occur with devtool</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
In message: [meta-virtualization][kirkstone][PATCH 1/1] kubernetes: Adjust =
patches to resolve error that occur with devtool<br>
on 02/11/2023 Soumya via lists.yoctoproject.org wrote:<br>
<br>
&gt; From: Soumya Sambu &lt;soumya.sambu@windriver.com&gt;<br>
&gt;<br>
&gt; Adjust patches and .bb to fix&nbsp; below error which occurs with devt=
ool modify command -<br>
&gt;<br>
&gt; ERROR: Applying patch '0001-hack-lib-golang.sh-use-CC-from-environment=
.patch' on<br>
&gt; target directory<br>
&gt; CmdError('sh -c \'PATCHFILE=3D&quot;0001-hack-lib-golang.sh-use-CC-fro=
m-environment.patch&quot;<br>
&gt; git -c user.name=3D&quot;OpenEmbedded&quot; -c user.email=3D&quot;oe.p=
atch@oe&quot; commit -F /tmp/tmp_ptvioq3<br>
&gt; --author=3D&quot;Koen Kooi &lt;koen.kooi@linaro.org&gt;&quot;<br>
&gt; --date=3D&quot;Mon, 23 Jul 2018 15:28:02 +0200&quot;\'', 0, 'stdout: O=
n branch devtool<br>
&gt; Changes not staged for commit:<br>
&gt;&nbsp;&nbsp; (use &quot;git add &lt;file&gt;...&quot; to update what wi=
ll be committed)<br>
&gt;&nbsp;&nbsp; (use &quot;git restore &lt;file&gt;...&quot; to discard ch=
anges in working directory)<br>
&gt;&nbsp;&nbsp; (commit or discard the untracked or modified content in su=
bmodules)<br>
&gt; \tmodified:&nbsp;&nbsp; src/import (modified content)<br>
&gt;<br>
&gt; no changes added to commit (use &quot;git add&quot; and/or &quot;git c=
ommit -a&quot;)<br>
&gt;<br>
&gt; stderr: ')<br>
<br>
The long log should also explain the change, not just what it<br>
fixes.<br>
<br>
In particular, indicate that devtool insists on working out of<br>
a specific directory (${S} ?), and that hwe have to adjust the<br>
paths of our patches to that directory structure, and also update<br>
the recipe patch listing to be able to still apply the changes<br>
during a build.<br>
<br>
Also, does master have the same issue ? if so, we need to fix<br>
it there first.<br>
<br>
&gt;<br>
&gt; Signed-off-by: Soumya Sambu &lt;soumya.sambu@windriver.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; ...ed_files-Fix-race-issue-for-installi.patch | 20 +++++++++++--=
------<br>
&gt;&nbsp; ...sh-convert-remaining-go-calls-to-use.patch | 18 +++++++++----=
----<br>
&gt;&nbsp; ...1-cross-don-t-build-tests-by-default.patch | 12 ++++++-----<b=
r>
&gt;&nbsp; ...ib-golang.sh-use-CC-from-environment.patch | 14 ++++++++-----=
<br>
&gt;&nbsp; .../kubernetes/kubernetes_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 8 ++++----<br>
&gt;&nbsp; 5 files changed, 42 insertions(+), 30 deletions(-)<br>
&gt;<br>
&gt; diff --git a/recipes-containers/kubernetes/kubernetes/0001-Makefile.ge=
nerated_files-Fix-race-issue-for-installi.patch b/recipes-containers/kubern=
etes/kubernetes/0001-Makefile.generated_files-Fix-race-issue-for-installi.p=
atch<br>
&gt; index 02bb5e91..e0ef04dc 100644<br>
&gt; --- a/recipes-containers/kubernetes/kubernetes/0001-Makefile.generated=
_files-Fix-race-issue-for-installi.patch<br>
&gt; +++ b/recipes-containers/kubernetes/kubernetes/0001-Makefile.generated=
_files-Fix-race-issue-for-installi.patch<br>
&gt; @@ -1,8 +1,8 @@<br>
&gt;&nbsp; From 441df8a24a2c80e320f140b5d9bc352c7ce8a64a Mon Sep 17 00:00:0=
0 2001<br>
&gt;&nbsp; From: Robert Yang &lt;liezhi.yang@windriver.com&gt;<br>
&gt;&nbsp; Date: Thu, 15 Oct 2020 07:27:35 +0000<br>
&gt; -Subject: [PATCH] src/import/build/root/Makefile.generated_files: Fix =
race issue for installing<br>
&gt; - go2make<br>
&gt; +Subject: [PATCH] src/import/build/root/Makefile.generated_files: Fix =
race<br>
&gt; + issue for installing go2make<br>
&gt;<br>
&gt;&nbsp; The src/import/build/root/Makefile.generated_files are called se=
veral times during the build, so the<br>
&gt;&nbsp; following target which installs go2make will also run several ti=
mes:<br>
&gt; @@ -24,15 +24,17 @@ problem.<br>
&gt;&nbsp; Upstream-Status: Pending<br>
&gt;<br>
&gt;&nbsp; Signed-off-by: Robert Yang &lt;liezhi.yang@windriver.com&gt;<br>
&gt; +<br>
&gt; +Signed-off-by: Soumya Sambu &lt;soumya.sambu@windriver.com&gt;<br>
<br>
There's no need to add your Signed-Off-By here, there's no<br>
changes in the the patch outside of context and line wrapping.<br>
<br>
Same comment for all the patches that are being tweaked.<br>
<br>
Cheers,<br>
<br>
Bruce<br>
<br>
&gt;&nbsp; ---<br>
&gt; - src/import/build/root/Makefile.generated_files | 4 +++-<br>
&gt; + build/root/Makefile.generated_files | 4 +++-<br>
&gt;&nbsp;&nbsp; 1 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; -Index: kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630=
/src/import/build/root/Makefile.generated_files<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630.or=
ig/src/import/build/root/Makefile.generated_files<br>
&gt; -+++ kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630/sr=
c/import/build/root/Makefile.generated_files<br>
&gt; -@@ -67,7 +67,9 @@<br>
&gt; +diff --git a/build/root/Makefile.generated_files b/build/root/Makefil=
e.generated_files<br>
&gt; +index d86a90cbb39..19a3d332476 100644<br>
&gt; +--- a/build/root/Makefile.generated_files<br>
&gt; ++++ b/build/root/Makefile.generated_files<br>
&gt; +@@ -67,7 +67,9 @@ $(META_DIR)/$(GO_PKGDEPS_FILE): FORCE<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [[ &quot;$(DBG_CODEGEN)&quot; =
=3D=3D 1 ]]; then&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo &quot=
;DBG: calculating Go dependencies&quot;;&nbsp; \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
&gt; @@ -43,3 +45,5 @@ Index: kubernetes-v1.21.1+git45da3fc33872083fb225c1a=
8c4d03e530d6f7630/src/import<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hack/run-in-gopath.sh go2make&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; k8s.io/kub=
ernetes/...&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --prune&nb=
sp; k8s.io/kubernetes/staging&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; +--<br>
&gt; +2.40.0<br>
&gt; diff --git a/recipes-containers/kubernetes/kubernetes/0001-build-golan=
g.sh-convert-remaining-go-calls-to-use.patch b/recipes-containers/kubernete=
s/kubernetes/0001-build-golang.sh-convert-remaining-go-calls-to-use.patch<b=
r>
&gt; index 8adbafb3..39fdac54 100644<br>
&gt; --- a/recipes-containers/kubernetes/kubernetes/0001-build-golang.sh-co=
nvert-remaining-go-calls-to-use.patch<br>
&gt; +++ b/recipes-containers/kubernetes/kubernetes/0001-build-golang.sh-co=
nvert-remaining-go-calls-to-use.patch<br>
&gt; @@ -4,15 +4,17 @@ Date: Wed, 12 Aug 2020 16:01:49 +0000<br>
&gt;&nbsp; Subject: [PATCH] build/golang.sh: convert remaining 'go' calls t=
o use<br>
&gt;<br>
&gt;&nbsp; Signed-off-by: Bruce Ashfield &lt;bruce.ashfield@gmail.com&gt;<b=
r>
&gt; +<br>
&gt; +Signed-off-by: Soumya Sambu &lt;soumya.sambu@windriver.com&gt;<br>
&gt;&nbsp; ---<br>
&gt;&nbsp;&nbsp; hack/lib/golang.sh | 8 ++++----<br>
&gt;&nbsp;&nbsp; 1 file changed, 4 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; -diff --git a/src/import/hack/lib/golang.sh b/src/import/hack/lib/gola=
ng.sh<br>
&gt; -index e9148ec08fa..71d3c987563 100755<br>
&gt; ---- a/src/import/hack/lib/golang.sh<br>
&gt; -+++ b/src/import/hack/lib/golang.sh<br>
&gt; -@@ -651,7 +651,7 @@ kube::golang::build_some_binaries() {<br>
&gt; +diff --git a/hack/lib/golang.sh b/hack/lib/golang.sh<br>
&gt; +index d0f4b00dadf..cef0c2075a3 100755<br>
&gt; +--- a/hack/lib/golang.sh<br>
&gt; ++++ b/hack/lib/golang.sh<br>
&gt; +@@ -654,7 +654,7 @@ kube::golang::build_some_binaries() {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kube::gola=
ng::create_coverage_dummy_test &quot;${package}&quot;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kube::util=
::trap_add &quot;kube::golang::delete_coverage_dummy_test \&quot;${package}=
\&quot;&quot; EXIT<br>
&gt;<br>
&gt; @@ -21,7 +23,7 @@ index e9148ec08fa..71d3c987563 100755<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; -covermode count \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; -coverpkg k8s.io/...,k8s.io/kubernetes/vendor/k8s.io/... \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;${build_args[@]}&quot; \<br>
&gt; -@@ -663,13 +663,13 @@ kube::golang::build_some_binaries() {<br>
&gt; +@@ -666,13 +666,13 @@ kube::golang::build_some_binaries() {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; done<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [[ &quot;${#uncovered[@]}&quot;=
 !=3D 0 ]]; then<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; V=3D2 kube::log::info =
&quot;Building ${uncovered[*]} without coverage...&quot;<br>
&gt; @@ -37,7 +39,7 @@ index e9148ec08fa..71d3c987563 100755<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
&gt;&nbsp;&nbsp; }<br>
&gt;<br>
&gt; -@@ -725,7 +725,7 @@ kube::golang::build_binaries_for_platform() {<br>
&gt; +@@ -730,7 +730,7 @@ kube::golang::build_binaries_for_platform() {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; testpkg=3D$(dirname &quot;${test}&=
quot;)<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mkdir -p &quot;$(dirname &quot;${o=
utfile}&quot;)&quot;<br>
&gt; @@ -47,5 +49,5 @@ index e9148ec08fa..71d3c987563 100755<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -gcflags &quot;${gogcf=
lags:-}&quot; \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -asmflags &quot;${goas=
mflags:-}&quot; \<br>
&gt;&nbsp; --<br>
&gt; -2.19.1<br>
&gt; +2.40.0<br>
&gt;<br>
&gt; diff --git a/recipes-containers/kubernetes/kubernetes/0001-cross-don-t=
-build-tests-by-default.patch b/recipes-containers/kubernetes/kubernetes/00=
01-cross-don-t-build-tests-by-default.patch<br>
&gt; index 659e3013..26a9b726 100644<br>
&gt; --- a/recipes-containers/kubernetes/kubernetes/0001-cross-don-t-build-=
tests-by-default.patch<br>
&gt; +++ b/recipes-containers/kubernetes/kubernetes/0001-cross-don-t-build-=
tests-by-default.patch<br>
&gt; @@ -11,14 +11,16 @@ components without error. As such, we patch the ta=
rgets out of the<br>
&gt;&nbsp; script to allow a successful build.<br>
&gt;<br>
&gt;&nbsp; Signed-off-by: Bruce Ashfield &lt;bruce.ashfield@windriver.com&g=
t;<br>
&gt; +<br>
&gt; +Signed-off-by: Soumya Sambu &lt;soumya.sambu@windriver.com&gt;<br>
&gt;&nbsp; ---<br>
&gt;&nbsp;&nbsp; hack/make-rules/cross.sh | 4 ++--<br>
&gt;&nbsp;&nbsp; 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; -diff --git a/src/import/hack/make-rules/cross.sh b/hack/make-rules/cr=
oss.sh<br>
&gt; -index 8e1e938..0898c5c 100755<br>
&gt; ---- a/src/import/hack/make-rules/cross.sh<br>
&gt; -+++ b/src/import/hack/make-rules/cross.sh<br>
&gt; +diff --git a/hack/make-rules/cross.sh b/hack/make-rules/cross.sh<br>
&gt; +index f8a6d0dbf5e..d22bf52b1cc 100755<br>
&gt; +--- a/hack/make-rules/cross.sh<br>
&gt; ++++ b/hack/make-rules/cross.sh<br>
&gt;&nbsp; @@ -33,6 +33,6 @@ make all WHAT=3D&quot;${KUBE_NODE_TARGETS[*]}&=
quot; KUBE_BUILD_PLATFORMS=3D&quot;${KUBE_NODE_PLATFO<br>
&gt;<br>
&gt;&nbsp;&nbsp; make all WHAT=3D&quot;${KUBE_CLIENT_TARGETS[*]}&quot; KUBE=
_BUILD_PLATFORMS=3D&quot;${KUBE_CLIENT_PLATFORMS[*]}&quot;<br>
&gt; @@ -29,5 +31,5 @@ index 8e1e938..0898c5c 100755<br>
&gt;&nbsp; -make all WHAT=3D&quot;${KUBE_TEST_SERVER_TARGETS[*]}&quot; KUBE=
_BUILD_PLATFORMS=3D&quot;${KUBE_TEST_SERVER_PLATFORMS[*]}&quot;<br>
&gt;&nbsp; +#make all WHAT=3D&quot;${KUBE_TEST_SERVER_TARGETS[*]}&quot; KUB=
E_BUILD_PLATFORMS=3D&quot;${KUBE_TEST_SERVER_PLATFORMS[*]}&quot;<br>
&gt;&nbsp; --<br>
&gt; -2.7.4<br>
&gt; +2.40.0<br>
&gt;<br>
&gt; diff --git a/recipes-containers/kubernetes/kubernetes/0001-hack-lib-go=
lang.sh-use-CC-from-environment.patch b/recipes-containers/kubernetes/kuber=
netes/0001-hack-lib-golang.sh-use-CC-from-environment.patch<br>
&gt; index 3a22a2ef..d3b71aef 100644<br>
&gt; --- a/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh=
-use-CC-from-environment.patch<br>
&gt; +++ b/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh=
-use-CC-from-environment.patch<br>
&gt; @@ -7,15 +7,17 @@ Toolchain tupples differs, especially when using ven=
dor provides ones.<br>
&gt;<br>
&gt;&nbsp; Upstream-status: Inappropriate [embedded specific]<br>
&gt;&nbsp; Signed-off-by: Koen Kooi &lt;koen.kooi@linaro.org&gt;<br>
&gt; +<br>
&gt; +Signed-off-by: Soumya Sambu &lt;soumya.sambu@windriver.com&gt;<br>
&gt;&nbsp; ---<br>
&gt;&nbsp;&nbsp; hack/lib/golang.sh | 4 ----<br>
&gt;&nbsp;&nbsp; 1 file changed, 4 deletions(-)<br>
&gt;<br>
&gt; -Index: kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630=
/src/import/hack/lib/golang.sh<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630.or=
ig/src/import/hack/lib/golang.sh<br>
&gt; -+++ kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630/sr=
c/import/hack/lib/golang.sh<br>
&gt; -@@ -414,19 +414,15 @@<br>
&gt; +diff --git a/hack/lib/golang.sh b/hack/lib/golang.sh<br>
&gt; +index e16a60d1867..d0f4b00dadf 100755<br>
&gt; +--- a/hack/lib/golang.sh<br>
&gt; ++++ b/hack/lib/golang.sh<br>
&gt; +@@ -420,19 +420,15 @@ kube::golang::set_platform_envs() {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ;;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;linux/arm&quot;)=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; export CGO=
_ENABLED=3D1<br>
&gt; @@ -35,3 +37,5 @@ Index: kubernetes-v1.21.1+git45da3fc33872083fb225c1a=
8c4d03e530d6f7630/src/import<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ;;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; esac<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
&gt; +--<br>
&gt; +2.40.0<br>
&gt; diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes=
-containers/kubernetes/kubernetes_git.bb<br>
&gt; index f475bd73..59892c92 100644<br>
&gt; --- a/recipes-containers/kubernetes/kubernetes_git.bb<br>
&gt; +++ b/recipes-containers/kubernetes/kubernetes_git.bb<br>
&gt; @@ -26,10 +26,10 @@ SRC_URI =3D &quot;git://github.com/kubernetes/kube=
rnetes.git;branch=3Drelease-1.23;name=3Dk<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; git://github.com/kubernetes/release;branch=3Dmaster;name=3Dkubernetes-rel=
ease;destsuffix=3Dgit/release;protocol=3Dhttps&quot;<br>
&gt;<br>
&gt;&nbsp; SRC_URI:append =3D &quot; \<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-hack-lib-golang.sh-use-CC-from-environment.patch">
file://0001-hack-lib-golang.sh-use-CC-from-environment.patch</a> \<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-cross-don-t-build-tests-by-default.patch">file://0001-cross=
-don-t-build-tests-by-default.patch</a> \<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-build-golang.sh-convert-remaining-go-calls-to-use.patch">
file://0001-build-golang.sh-convert-remaining-go-calls-to-use.patch</a> \<b=
r>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-Makefile.generated_files-Fix-race-issue-for-installi.patch"=
>
file://0001-Makefile.generated_files-Fix-race-issue-for-installi.patch</a> =
\<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-hack-lib-golang.sh-use-CC-from-environment.patch;patchdir=
=3Dsrc/import">
file://0001-hack-lib-golang.sh-use-CC-from-environment.patch;patchdir=3Dsrc=
/import</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-cross-don-t-build-tests-by-default.patch;patchdir=3Dsrc/imp=
ort">
file://0001-cross-don-t-build-tests-by-default.patch;patchdir=3Dsrc/import<=
/a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-build-golang.sh-convert-remaining-go-calls-to-use.patch;pat=
chdir=3Dsrc/import">
file://0001-build-golang.sh-convert-remaining-go-calls-to-use.patch;patchdi=
r=3Dsrc/import</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-Makefile.generated_files-Fix-race-issue-for-installi.patch;=
patchdir=3Dsrc/import">
file://0001-Makefile.generated_files-Fix-race-issue-for-installi.patch;patc=
hdir=3Dsrc/import</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://cni-containerd-net.conflist">file://cni-containerd-net.=
conflist</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://k8s-init">file://k8s-init</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://99-kubernetes.conf">file://99-kubernetes.conf</a> \<br>
&gt; --<br>
&gt; 2.40.0<br>
&gt;<br>
<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#8410): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/8410">
https://lists.yoctoproject.org/g/meta-virtualization/message/8410</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/10234139=
6/1050810">
https://lists.yoctoproject.org/mt/102341396/1050810</a><br>
&gt; Group Owner: meta-virtualization+owner@lists.yoctoproject.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtuali=
zation/unsub">
https://lists.yoctoproject.org/g/meta-virtualization/unsub</a> [bruce.ashfi=
eld@gmail.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM6PR11MB3404FC3F43CD7267ECFE886881AEADM6PR11MB3404namp_--

