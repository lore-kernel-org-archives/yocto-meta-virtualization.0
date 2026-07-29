Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A544C54F51
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 12:03:43 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9738.1785326620060427228
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 29 Jul 2026 05:03:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=VMkBeLgm;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=jhXu4X9H;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TBlpEZ1511966
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 29 Jul 2026 12:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NxCiA+3tEuRPT5UhKQ50Tn7mW08IynaMFPRBfj92sfk=; b=VMkBeLgmz8DCgV2q
	rKXqyrI5I/MObDFsG1+wd6o3Kdh/PNqBTKIVPoI4qpcD0C3litJVPF1eSNoOVXc+
	oCxKVVT/1Kafnt0D8tQhhIDS9RZ6ejtt0aFzPLye0m5WaYU1uEd8sv2ibn1Bst60
	0WLMd3PSV93li4e9kzevO/wFyiUi1xALw+YdYaLbc5ztMlbSniXIQ7+q2PT1aP8w
	Wu91otHmotlESb7cK4bTbsBBGkG7x3CGKeijea0XcbsA/CJPbM6ncYTEdKQQ7oAW
	e/OQRsUAe46GWr6Qf/9+wGiK8zmber5rZ9jorwj1xFyhnktatNIZeerFWBC9w+gw
	cSTNPA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgy901vc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 29 Jul 2026 12:03:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0f0a0760so17994881cf.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 29 Jul 2026 05:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785326618; x=1785931418; darn=lists.yoctoproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NxCiA+3tEuRPT5UhKQ50Tn7mW08IynaMFPRBfj92sfk=;
        b=jhXu4X9HNC6cUGTZRUKQZ1KAhg4Ajrk42krcz0r6u1eEh2jwNx0eG8PpN29rk7ZRow
         seuIgUjsN0VPnhvKkaRr1tNOUuTpNTGoMieDPqOMvpPUklvcsxa8F5eGqSIaRaj/kFc6
         Rh1s8wma2pc80u80j0kkrmJK8HlvtOIxuU1BGqEOw+5uJRRXS/zrMRMH7M1NkoAdWKlY
         dURw04mP+l2Dz27/arpDAEjEh8d+UuGIl9YZk7RSWja6slnBI6my8VBeuKfYVPl7f+wk
         6H/IkY/5dcF/gZ3kkjuMPFYvLp1lhEARXvmoar2OeaWx8jJjL4kbxFqOmNyPd2iEiU0E
         aaww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785326618; x=1785931418;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NxCiA+3tEuRPT5UhKQ50Tn7mW08IynaMFPRBfj92sfk=;
        b=aXT0cFm7UC6N/QBgfdM8RupEzrWx5PuqBdBVngGOP3M34nRKLNh3ddD9X0OqFSIJAC
         bNoFAj7JVxhzVJUBHsSMkWMGjlDKeXf5z40xiTK+nVOJcxcInEVUlFb0O8HvUmiav+sC
         k9Ttqj8iBoBhsaJnxNHlpvo4yrsRiTB0fpoeX1w90aeY7fv03pN9EXrGOvBwgQiOKJrd
         5TxopTB//heiXNuQ9oOt4VSYwWiU2+3DPoSoLq/RmmxrRpazs8uuT2z6WnRoDJcx08ia
         eqXM7rERlOmD3yqPZQ3rVbTkoRNRwM/6NAzqj1TbeL5XXB4QVhvinUFA9po48SAgXr2t
         BH0A==
X-Gm-Message-State: AOJu0YxhQPSp5l5R0U74d9CjavpVv4T2tk47tr7v6jG1AuJbcVohVFS+
	wQb5sjFuI0xcOepc3r/F2LeqQVNMv0wsgtKsS3GAecD8qPml2Bw2F36sJXv/NZKw2mR2g12Kkwy
	dSInIPJnJiNXnyHeXg/N8UvOD5dZrrV6LpQ06v8GpSed8OkgMbuGotfa1mPcM9mcEKCdxvGcJEh
	Cz4hyUwYC2vA==
X-Gm-Gg: AR+sD11rEo8GZTsmdJ+nGusnLek08dnclCDX32ICpgHFIAh3HMXmwFS60Kq0mqagg/D
	oT34ntA3ZE/X9BYlsgDfAkA7tJxpJlxfzqJGu/taA7G+dYddvLLyODLRLF5esv8hR0PmBaMzRS/
	vOj/KZScmFLU4S857HmTo9q+yxILMXQhdN2nFFAIHF9Zkxbsz2q7meP/g8QDHo0pSwfohC+1zfU
	sQkmJlEENcffPqMGb+es3bZubqfUA7pTJbL7Q10I9ukJVridA3e81vBAjYFMU0df1hU+WlPKd+9
	CQCpYdfVAgG9Cde73AwaY1eGOSNEisfZCXHEr093pS+1sEVPLfQ8KXwe50jgA39mL2av8mmwZFJ
	sL0JnvXBC5lgaFiaWnvBcNFucHFsJEz8ZSymmf4yJ
X-Received: by 2002:a05:622a:429b:b0:527:7454:66cd with SMTP id d75a77b69052e-529d7269f5emr53858071cf.80.1785326617949;
        Wed, 29 Jul 2026 05:03:37 -0700 (PDT)
X-Received: by 2002:a05:622a:429b:b0:527:7454:66cd with SMTP id d75a77b69052e-529d7269f5emr53857441cf.80.1785326617304;
        Wed, 29 Jul 2026 05:03:37 -0700 (PDT)
Received: from smtpclient.apple ([2a01:90a0:1ff:8900:387d:d42a:ac54:57fa])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a050c65870sm722014a12.25.2026.07.29.05.03.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Jul 2026 05:03:36 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [meta-virtualization] [PATCH 2/2] image-oci: drop *-initial
 sysroot deps in do_image_oci to avoid libgcc collision
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
In-Reply-To: <6a6970bd.406b8c64.14ed61.8fa1@mx.google.com>
Date: Wed, 29 Jul 2026 14:03:24 +0200
Cc: meta-virtualization@lists.yoctoproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <5437D436-C625-4B0C-8639-94E02C91640E@oss.qualcomm.com>
References: <20260728115516.1107990-1-koen.kooi@oss.qualcomm.com>
 <20260728115516.1107990-3-koen.kooi@oss.qualcomm.com>
 <6a6970bd.406b8c64.14ed61.8fa1@mx.google.com>
To: bruce.ashfield@gmail.com
X-Mailer: Apple Mail (2.3864.600.51.1.1)
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEwMCBTYWx0ZWRfX9GhBtcWWk5fd
 U5IzC+weTjhbCydLfyeoHqnW4bsvd9xatmxxNah7dIVQl+qZRAcfD/bza69Vq1UkPdsPT2K5aWG
 ENqvbcfzKGndCxnsv+ZcMbnHVEazFTY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEwMCBTYWx0ZWRfX3SN62TRDQ+xK
 DfyHb1kWCWkpCsebuGysDBPgpRWDg/7sJecKsGD3/6qesnhIJAaJe0HGcHqWKgwhh1TLfr9ia9i
 g2EywR8VMXTQ03JaO7qZcYndeiKO+/6udNOWT8z2VEWfoZ4lrBuWHdZFI7dTQsBXdQeLEYAcr2R
 eTv7Y8Go36H8FR2BFbAK76Be0zIwmS99HM3lrEyNCjb65GAUTbywOb2BX+u5Z+ftvyWoezCAIER
 03yqUqdaOmlWrz1X0Io8T+G3bpGs7ZwEe4ryLen7DaXYnDPsFJyC5NJbG5ZuCSZnbGd2LNSHKAR
 XPwJ9A7mXHTjf/X4hcm1QigQnTw9ZHwJprS9K6gcgl20lm769SFdSULCv1MserHXMwVgROx6iMm
 9+EMVi1TdNE5g5V3R2JU69zQPGPBuU4ncGc/NsyuzEY9fBAXLAChnGceGUDR9QiPt6h3vqNHnVt
 zs1tXSyVjZmQrmFn6Eg==
X-Authority-Analysis: v=2.4 cv=LtKiDHdc c=1 sm=1 tr=0 ts=6a69ec1b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=NEAV23lmAAAA:8
 a=iGHA9ds3AAAA:8 a=EUspDBNiAAAA:8 a=4nbGC4-k4zzOEf7es6gA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: BWMW_MLxdfNMBH9XyPjrucfxo8fHOMu2
X-Proofpoint-ORIG-GUID: BWMW_MLxdfNMBH9XyPjrucfxo8fHOMu2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290100
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 29 Jul 2026 12:03:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10015



> Op 29 jul 2026, om 05:17 heeft Bruce Ashfield via =
lists.yoctoproject.org <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org>=
 het volgende geschreven:
>=20
> [...]
>=20
> Two questions to unblock:
>=20
> 1) Can you share the specific recipe (or the DEPENDS shape) from
>  the downstream build where you hit this deterministically?
>  Something along the lines of a multilayer packages: layer
>  pulling a from-source-compiled library with a boost-ish
>  DEPENDS, if I'm reading your cover right, but I'd rather work
>  from your actual trigger than guess.

The incredibly messy WIP branch is here: =
https://github.com/koenkooi/meta-ai/tree/full-integration-test, you can =
build it via kas-container, but that will apply these (and more) patches =
to meta-virtualization automatically.

The important bits:

 meta-ai-tensorflow-lite-oci
   OCI_LAYER_MODE =3D "multi"
   OCI_LAYERS =3D "tensorflow-lite:packages:tensorflow-lite"
   OCI_BASE_IMAGE =3D "meta-ai-container-base-oci"

 meta-ai-container-base-oci
   OCI_LAYERS =3D =
"base:packages:base-files+base-passwd+netbase+glibc+libgcc+<abseil =
libs>"

DEPENDS in app image: flatbuffers-tflite, jpeg, libeigen, protobuf, plus =
gcc-runtime/abseil pulled through the base layer.

> 2) Was there anything else in that build environment worth
>  knowing -- IMAGE_PKGTYPE pin, non-default MACHINE, a specific
>  PACKAGECONFIG that pulled in one of the *-initial-adjacent
>  recipes? Anything that narrows the search.

I reproduced it with qemuarm64 as well now, instead of meta-qcom =
machines:

MACHINE=3Dqemuarm64
  * meta-virtualization master-next
  * IMAGE_PKGTYPE unset -> default ipk/opkg
  * No PACKAGECONFIG

The reproducer itself, clean sstate, first try, unpatched:

 ERROR: meta-ai-tensorflow-lite-oci-1.0-r0 do_image_oci: The file =
/usr/lib/aarch64-oe-linux/16.1.0/crtendS.o is installed by both libgcc =
and libgcc-initial, aborting

Now the bad news: the patch fixes do_image_oci, but not =
do_image_complete, that hits the same issue on the same file:

 ERROR: meta-ai-tensorflow-lite-oci-1.0-r0 do_image_complete: Error =
executing a python function in exec_func_python() autogenerated:
 Exception: FileExistsError: [Errno 17] File exists: =
'/build/oe/repro/bugtest-qemux86/build/tmp/sysroots-components/cortexa57/l=
ibgcc-initial/usr/lib/aarch64-oe-linux/16.1.0/crtendS.o' -> =
'/build/oe/repro/bugtest-qemux86/build/tmp/work/qemuarm64-oe-linux/meta-ai=
-tensorflow-lite-oci/1.0/recipe-sysroot/usr/lib/aarch64-oe-linux/16.1.0/cr=
tendS.o'

So patch 2/2 isn't enough to fix this issue :(

regards,

Koen

>=20
> I'll try a boost-multilayer-packages recipe over several clean-sstate
> cycles in the meantime and report back either way.  Once we have that,
> merging this (in whichever variant) is easy.
>=20
> Below is the shortened variant I mentioned -- meant to fully replace
> the two python blocks + the comment header in your 2/2, drop-in on the
> same insertion point in image-oci.bbclass. Same mechanism as yours:
> event handler on RecipeTaskPreProcess attaches a prefunc to
> do_image_oci that filters *-initial do_populate_sysroot nodes out of
> BB_TASKDEPDATA before extend_recipe_sysroot walks it. Differences are
> stylistic -- no deep-copy (dict comprehension builds a fresh dict
> directly), set comprehension for the drop set, comment made smaller.
>=20
> Not requesting a v2 on this; posting so you can try it against your
> downstream trigger and see if it holds up the same way your original
> does.
>=20
> # =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> # Work around libgcc vs libgcc-initial sysroot collision in =
do_image_oci
> # =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> #
> # do_image_oci[depends] contains "...:do_populate_sysroot" entries, so
> # oe-core's staging_taskhandler auto-attaches extend_recipe_sysroot as =
a
> # prefunc. That walk exposes the full transitive populate_sysroot =
closure
> # into this recipe's private sysroot -- including both libgcc and
> # libgcc-initial, which collide on crtbegin.o.
> #
> # oe-core's SSTATE_EXCLUDEDEPS_SYSROOT (".*->.*-initial.*") is gated =
on
> # the consuming task being do_populate_sysroot (see =
setscene_depvalid()
> # in sstate.bbclass); for do_image_oci that gate is False and the
> # exclusion is skipped. extend_recipe_sysroot itself has a hardcoded
> # "*-initial" skip but only for do_sdk_depends / do_populate_sdk_ext
> # (staging.bbclass:457) -- an oe-core task allow-list we can't cleanly
> # extend from a downstream layer.
> #
> # Filter *-initial do_populate_sysroot nodes out of BB_TASKDEPDATA =
before
> # extend_recipe_sysroot walks it. extend_recipe_sysroot re-reads
> # BB_TASKDEPDATA on each entry, so a setVar with the filtered dict is
> # sufficient.
> python oci_strip_initial_taskdepdata () {
>   tdd =3D d.getVar("BB_TASKDEPDATA", False)
>   if not tdd:
>       return
>   drop =3D {k for k, v in tdd.items()
>           if v[1] =3D=3D "do_populate_sysroot" and =
v[0].endswith("-initial")}
>   if not drop:
>       return
>   filtered =3D {k: v for k, v in tdd.items() if k not in drop}
>   for v in filtered.values():
>       v[3].difference_update(drop)
>   d.setVar("BB_TASKDEPDATA", filtered)
>   bb.note("OCI: dropped %d *-initial node(s) to avoid libgcc =
collision" % len(drop))
> }
> oci_strip_initial_taskdepdata[vardepsexclude] +=3D "BB_TASKDEPDATA"
>=20
> python oci_attach_strip_prefunc () {
>   task =3D "do_image_oci"
>   if task in e.tasklist:
>       deps =3D d.getVarFlag(task, "depends")
>       if deps and "populate_sysroot" in deps:
>           d.prependVarFlag(task, "prefuncs", =
"oci_strip_initial_taskdepdata ")
> }
> oci_attach_strip_prefunc[eventmask] =3D =
"bb.event.RecipeTaskPreProcess"
> addhandler oci_attach_strip_prefunc
>=20
> Bruce
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#10014): =
https://lists.yoctoproject.org/g/meta-virtualization/message/10014
> Mute This Topic: https://lists.yoctoproject.org/mt/120482434/9418801
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: =
https://lists.yoctoproject.org/g/meta-virtualization/unsub =
[koen.kooi@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


