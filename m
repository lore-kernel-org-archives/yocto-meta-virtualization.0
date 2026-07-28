Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2228C54F54
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 17:31:19 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1803.1785259876876381983
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 10:31:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Ofr52Y5t;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Rz2kNU1g;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SEdRkH2956017
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 17:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oUmSORskYjUGm2jnvf9b8F+x
	haRhOKKteVUIEA5ENSA=; b=Ofr52Y5t/39NSUbd2bzoLb6XHrwg3OGDcdkToZ1t
	0ABiHNQ+v6zEGeH48k45b0XQbP7TeEllwNyZdnxM6fIgDwzZfxuaAheWNy3RkuE+
	u/uFAsnVlyMQceHZImHkGr4jUEt3ttHK8wrasyPxTB/hb4fNynshHljxd6zzrJTj
	VVeumhVUCr/D04LA1KAm3wZ854FqnOdPRPqq018/gaRZpNx3VqUEmZ4bYBZUMB2R
	94JVK8hq3w1JRz3v5GS0moU7UYfJrrlK5KSx6WelZSeA1HQ5IKTqzZESwKvxeu/M
	PNW3oTqhBtNlFxDLF1aTYMR31o1CtWids7b2K5ofwjXJhA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpw731h60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 17:31:13 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-737f1f1e0e5so9694137.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 10:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785259873; x=1785864673; darn=lists.yoctoproject.org;
        h=references:to:cc:in-reply-to:date:subject:mime-version:content-type
         :message-id:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oUmSORskYjUGm2jnvf9b8F+xhaRhOKKteVUIEA5ENSA=;
        b=Rz2kNU1gT7rBQEXYQd7AJ8TyJ/bgKRbsnBXuV0PYu+SmJ5/u8iQMDimeE4RbSxTSjo
         +TZzT05CvVRSu6zJAhipFjwfZ3peG7yt7ILxnWT8yauidsDo/OBGWiucY9DQtdMuGg1o
         kD3RK380vqwFRqOCRWw22pFi30TVX43EpHWslMV80viDg6DSn/2BYnmiFcpV36xo+2b7
         0DtyDPqacWack/s1KMs8aqWAFbwAwKnA8gJPnkxrzRAjBlXDLncJtOV8ntQMxiX19ScR
         35YMbAJBcg2Q3+0//z4CiVNliJdeGAGBtFJPEfC0zRAr9LW3tOUmsxjx6g/yAXde5fVg
         2zkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785259873; x=1785864673;
        h=references:to:cc:in-reply-to:date:subject:mime-version:content-type
         :message-id:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oUmSORskYjUGm2jnvf9b8F+xhaRhOKKteVUIEA5ENSA=;
        b=nahtPKKE3igXKq+JAtlAw8t1kFbNO9yYj99PhgfClDls42uhrPBnG3wRKQKXVflScD
         bMfRRAgkEr2kS44htTl4SbG9eRynFMw+WP11dQPNI77P3IvS67fMrMhZJ3PhX1DixFaD
         6df+MbOHy9mrMl94VMzanBOI6h19NaY4XzcjuwdmC6oa+KP/s0jNTN18em0sbj44meJB
         O0HpaD33WuScWu/B9DviXlzGpY2RTm80eNNwE9a0ns3F84aHAe2TjkrSyCi7epLxx6oD
         rjS6UN1I2Y55EvTJFj/ktc7MFkmIu+XaQYBPo/1jwHVJRGC6B7TAKuQ3o1XXtyLXx/9R
         WOsA==
X-Gm-Message-State: AOJu0YwXnC8CBIvOAHGewcfythRo7xWBJkCro2LF92dcFUbB4GWqC5RE
	UUJjc5dO1hrAeZ9M3SjGsnsUFiPVV1d6F8MOg+p+YW7No6AQCMaIkEj3c3h10qESjOFwnnTSLfL
	mFBs7bWhX99KZQUCm+73MelHDt1V7s3GlA1FqbQ4uLz5gT/WQklzcRRFGyWbMw2JtF/3PQo35Q1
	YdkXVW1X/lBQ==
X-Gm-Gg: AR+sD1152Q718GVGenptPl4NmseND0FmKRmxyDLmweuiRNB8TweBdrN2gKzxNrto1CH
	kfAYhsfL3JVGX+3ckQEUVdO/65rUH/jZv9hzqrTr9RO81uDW44v5WZcu21PUK0iB2KRSJuaVcuo
	4ocz9ZKfpYgq/V3xmTPdaUJMn+9VNN6Jhl10Mk09Aanj/9rVAtJZsjkxIsq7HLH1Fmv0ROwr5BQ
	WGyoxXHMz/IEVvMzQSBleZgBiPW58ojkJfitAEPNyV7CXUVDFSpSDFMDLOeb0qv2LCcptz+4d3J
	7WeAwJqUI1RNdyoQk2S2Jaw82qBqtJWGUXplZLf71cdN8zhl7goKNn0r/y/h1WtBd8eHlO5wH0U
	rdLLhYPcdCVs3sDRA1tDwUsiGvQWf5rYJiY3dNYe6
X-Received: by 2002:a05:6102:3a0f:b0:74c:7dbd:8c89 with SMTP id ada2fe7eead31-754a2bc0982mr1668388137.25.1785259872705;
        Tue, 28 Jul 2026 10:31:12 -0700 (PDT)
X-Received: by 2002:a05:6102:3a0f:b0:74c:7dbd:8c89 with SMTP id ada2fe7eead31-754a2bc0982mr1668364137.25.1785259872012;
        Tue, 28 Jul 2026 10:31:12 -0700 (PDT)
Received: from smtpclient.apple ([2a01:90a0:1ff:8900:fc75:4796:952a:9dc3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f83fe70d0sm11349566b.53.2026.07.28.10.31.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2026 10:31:11 -0700 (PDT)
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
Message-Id: <46594408-3983-4951-A657-F0FD80A1A456@oss.qualcomm.com>
Content-Type: multipart/mixed;
	boundary="Apple-Mail=_7CA04D86-0F02-4C0A-AF5B-12023013CF55"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [meta-virtualization][PATCH 0/2] image-oci: two do_image_oci
 bugfixes (missing pm.update(), libgcc/libgcc-initial sysroot collision)
Date: Tue, 28 Jul 2026 19:30:55 +0200
In-Reply-To: <CADkTA4NRnwrXxgpU7Hwf55SmVEhTDnTidSwvQgpOkHTRWbVG6g@mail.gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20260728115516.1107990-1-koen.kooi@oss.qualcomm.com>
 <CADkTA4NRnwrXxgpU7Hwf55SmVEhTDnTidSwvQgpOkHTRWbVG6g@mail.gmail.com>
X-Mailer: Apple Mail (2.3864.600.51.1.1)
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDE1NCBTYWx0ZWRfX5rJo5X7QEyiA
 0mkvoppnNDvy992AtAWHoXvsxoYiR9nz1Ehii7dgPNcnBCTiv98HIvIoNiWsR3WaSSw/agGhVxY
 Cbxl46FY7voUwe2X8+d7ZIyEt+ObVQY=
X-Proofpoint-GUID: 6gB-2G_-nC-KABq-P6_9Wj_XY6FNVbq-
X-Proofpoint-ORIG-GUID: 6gB-2G_-nC-KABq-P6_9Wj_XY6FNVbq-
X-Authority-Analysis: v=2.4 cv=NobhtcdJ c=1 sm=1 tr=0 ts=6a68e763 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8 a=iGHA9ds3AAAA:8
 a=4PzrUzwaxuZLW_ld2tMA:9 a=QEXdDO2ut3YA:10 a=9HnVpSuuHUwcsuANnAIA:9
 a=49ladYHvHUoA:10 a=mpd-woop7mMA:10 a=HiLRGq3uS_oA:10 a=EUspDBNiAAAA:8
 a=O_wIvJgnzn5pwSqCA6IA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDE1NCBTYWx0ZWRfX6gXCcW9ya0Oo
 nUM+EmUcVPcObK1348OU/5WR2dyNVZImZTle+Q/EKyUr16ebd8bwzWJdunR6a0W0zowoW5GueRW
 KgDwGC4NNVt8z4kqX96W58/Fz3nl1OmnThyNthUqtZjMMddxbtJDZq+FeP75os1HDPtBJ2xQAnu
 pKyZ6x3MfmMCB4YC9nznFe/gOWCEF6lY3tSEODFllctly3t16U9fBNjo8SHK02Oq+4ID2emFd+h
 im5pUW1D9sACB+O2Dar9yYcaaiVc16ZSt6M9R5ChROtB9ZkVpaW8K3YGGUwR3bkAbUEhLtnpFfk
 CwheJZd7uuBu/dxFi+ta9jWwvfYMZ8WJf65LTQK1qDq6N/JKY5Hp5qgtOYNrA/2i43VprXWbbSN
 UuWEXHpohtolfJNmB1nd22L/oviix9x7dDnFsFnARBkPWQ9R+EHqvislEcoTIZoPW4gD/0hJz7l
 lYcVz0Cx3VqC6s7+u/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280154
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 17:31:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10001


--Apple-Mail=_7CA04D86-0F02-4C0A-AF5B-12023013CF55
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> Op 28 jul 2026, om 14:45 heeft Bruce Ashfield =
<bruce.ashfield@gmail.com> het volgende geschreven:
>=20
> On Tue, Jul 28, 2026 at 7:56=E2=80=AFAM Koen Kooi via =
lists.yoctoproject.org
> <koen.kooi=3Doss.qualcomm.com@lists.yoctoproject.org> wrote:
>>=20
>> I've been working on a prototype for building a rootfs with multiple =
multi-layer OCI images images, all built from scratch, in one bitbake =
command. I ran into some issues along the way:
>>=20
>> * image-oci never runs "opkg update" or its rpm equivalents, so =
nothing gets installed
>> * both libgcc-initial and libgcc want to be in the sysroot
>>=20
>> The first issue is straightforward, for the second I leaned heavily =
on Claude to write a proper python version and explain it better. I'm =
not fond of the wall of text that ends up with, but this is already the =
3rd iteration of trimming it down.
>>=20
>> Anyway, This is the first wave, I'm working on other fixes, like =
mtime influencing base-layer sharing, but that needs more testing and =
review. I do need to mention how surprisingly small the resulting image =
recipes are, a big thanks to everyone who has been working on this!
>>=20
>> Below is what Claude suggested as coverletter, it is still verbose, =
but doesn't suffer from the "Is Koen being sarcastic or not?" issue :)
>>=20
>> 1/2 - image-oci: call pm.update() before pm.install() for multi-layer
>>      package layers
>>=20
>>  Multi-layer OCI images (OCI_LAYER_MODE =3D "multi") with a =
"packages:"
>>  layer silently produce an empty layer: do_image_oci reports success,
>>  but the layer's opkg/rpm install never actually installs anything,
>>  because the per-layer package manager's local index/cache was never
>>  refreshed after write_index() (do_rootfs itself always calls
>>  pm.update() between the two; image-oci's per-layer installer
>>  skipped it). The failure is only visible as a bb.warn(), so the
>>  build looks green while shipping an empty (or partial) layer.
>=20
> Aha. Since I've obviously tested the package installs and they work,
> but multi layer is something that I don't recall testing in that =
combination.

It's a first for me as well :)

>=20
>>=20
>>  Reproduced with a minimal recipe (base-files+coreutils in a
>>  "packages:" layer): before the fix, the resulting OCI layer blob
>>  contains 0 regular files; after the fix, the same layer contains
>>  272 files and the compressed blob grows from 299 bytes to 7.5 MB.
>>  Full before/after evidence in the patch commit message and in
>>  TEST-CASES.md if you'd like to reproduce it independently.
>>=20
>=20
> I'd definitely want to see a reproducer, both so I can confirm how
> I didn't see this before, and so I can get it into the layer tests.
>=20
> Does this same image reproduce the second issue as well ?

It does not, I've attached a tarball with what I think is the minimal =
reproducer from scratch. Tried it on a different, clean build machine =
and after suffering through llvm/clang/boost builds, it does reproduce! =
My robot buddy summed it up as:

Both real builds ran to completion, first-hand:
    =E2=80=A2 Bug 1 (pm.update): reproduced live =E2=80=94 0-file layer =
unpatched, confirmed by extracting the actual OCI tar myself.
    =E2=80=A2 Bug 2 (libgcc-initial): the raw abort didn't fire in two =
attempts (plain build + cleansstate-forced rebuild), matching the =
earlier investigation. But I got independent proof of the mechanism that =
doesn't need Koen's patch at all =E2=80=94 a bitbake -g + =
task-depends.dot BFS showing libgcc-initial.do_populate_sysroot is =
genuinely reachable from do_image_oci via the rootfs/SPDX chain. Bonus: =
the boost recipe also hits bug 1, so it's not coreutils-specific.

> I'd also like to reproduce that, to hunt around and see if there's
> any other options to resolve the problem.

The blacklisting of -initial feels a bit too specific and narrow to me. =
But I've never really looked into this part of OE, so I don't trust my =
feelings on that.

regards,

Koen

Robot generated text:

Reproducer attached (image-oci-repro.tar.gz): standalone kas tree, =
oe-core + meta-openembedded + meta-virtualization, all master, =
qemux86-64, package_ipk. README has the exact commands; short version =
below.

  kas checkout kas-bugtest.yml
  . openembedded-core/oe-init-build-env build
  rm -rf oci-layer-cache && bitbake test-oci-pmupdate

do_image_oci warns "Unable to install packages... Couldn't find anything =
to satisfy 'base-files'" but reports Succeeded. Pulled the shipped OCI =
tar apart: layer blob is 299B compressed/7680B uncompressed, 0 regular =
files, just the bin/lib/sbin/usr/var skeleton. With 1/2 applied + cache =
cleared + cleansstate: 272 files, 7.5MB, all the expected =
coreutils/base-files content.

Same image doesn't reach bug 2 - coreutils never pulls libgcc into =
do_image_oci's walk. Swapped it for boost (test-oci-initial-collision, =
also attached): same multi+packages shape, so it hits bug 1 too (opkg =
install of base-files+boost fails the same way - not just a coreutils =
quirk). For bug 2 specifically: `bitbake -g` + a BFS over =
task-depends.dot from do_image_oci finds do_image_oci -> do_image -> =
do_create_rootfs_spdx -> libgcc-initial.do_create_spdx -> =
libgcc-initial.do_populate_sysroot - so libgcc-initial is reachable, via =
do_rootfs's own SPDX chain, not via do_image_oci's declared [depends] =
(umoci/jq/opkg/rsync-native, none of which reach it). That's the =
mechanism confirmed live, no patch needed to see it.

Couldn't force the raw crtbegin.o abort itself, unpatched, in two tries =
- plain build, and cleansstate on =
libgcc+libgcc-initial+umoci-native+jq-native+recipe. Both built clean. =
Consistent with what we saw downstream: depends on whether =
extend_recipe_sysroot actually has to populate both libgcc variants vs. =
setscene-shortcut them, which cleansstate on a handful of recipes =
doesn't control. Downstream hit it deterministically over 6+ =
clean-sstate attempts on a wider DEPENDS set; not reproduced here.

Options I looked at for 2/2 besides the BB_TASKDEPDATA strip: fixing =
SSTATE_EXCLUDEDEPS_SYSROOT in oe-core to key off the dependency instead =
of the consuming task being do_populate_sysroot (root cause, wide blast =
radius), keeping do_image_oci off staging_taskhandler's generic prefunc =
path, giving do_image_oci its own sysroot. Happy to take a run at any of =
those if you'd rather not carry the strip as a meta-virtualization-local =
workaround.


--Apple-Mail=_7CA04D86-0F02-4C0A-AF5B-12023013CF55
Content-Disposition: attachment;
	filename=imageocirepro.tar.gz
Content-Type: application/x-gzip;
	x-unix-mode=0644;
	name="imageocirepro.tar.gz"
Content-Transfer-Encoding: base64

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
l50WQbxod3MGNizIamk3qUo2M8iG0b44ftPqtS+RRZ+f0/iF84y087x9+ebdcYc6c8ZLOuHA9oF2
vLnF0i2j46IhJe0sB8g5VtCzu+/fUlbexLtiCvDHDr1UAGewaD9F0K1b4WKbR4eGRJWqrgfJXdlJ
fH+azj+9uuwety+xz7u86p2BeYp1NZC5XEOlt7qKOu/oZDQ2ZwXVTQe9KayUhOM3NGt9j2oA4eyg
r6l3eHrjkwmRWVJyXb1R+6+0ulCgs3p9y6NovMx20mvHitts/v+j/Vb/v6Y4G9Z4xP/XG43V+H9Q
3d3d+v/naC/Zu/SOwCHVBFTVg0qhVDnUpZhQuIGq++KlNyvSmXA/P2Z3CtKbApMRp+rf+nGRHLmh
pILR0immqdxct9Xp9i7al6nv/LF9Du/8Z/Kp1SqcnD7vVRUvWrannVpa9aKqDN1LKBTZJ3UrIT0R
HnqiX1LnwiUmZImqjLQiHjCcngw1Wh9J04HtEXPMIY//akWFfPviDWLG+dX7s/Z1XtXu5n26g4p7
2j3niwoQ4EvAoGVN+q8gpEllE/MjeFeYLVNi+e+zo+x8UU91B7oWBQjN2dWMWQEvBw4pdqty22wy
habvZI59NyehqEny3UDxFtio8+4Z5vexmvBQM9VZX8Yfs8uJk1Y0PVPFbBERj6m25odzNPUUzVtT
HboTGR+qN3poc+mqSWzyuziybEocCgCTLqt4QCf1wHjlBH+JiZgB9i2d6RdnAHx9nq6IxoD7D/lN
GXpuXMg388UPtZv5/OzQ/3NwUOf5eTzoI308pcsXiws0xQKEAl519oYsSJuDG8xW/JDX94PyN8vc
mhGkuh8lYLM0Pgv5DHcSmbciszkhO0dMJn6hpqjwVWoUk275dEcuorIzFNk3XQkLLyzyAaoM/eaL
mvyds+QHChJr25GQknoUvXiVW0PkO1ZQuJSYB9rWGbioEEBG4/2nmUUsU7bJwvhdCFWH/3t9tIqj
1AcWnMr8bB011XIakRJYlAQOIJB9FrLlSxoh4PirsXTyFwoZU51V3hCTcw87utxXT8u+MP6vX/R6
YI2n7//39/aq2/3/czSzYlb+co7d07kbjL/RGgv5n5L1yt9qbe9gSReqtVqjuv+CnX8jfJZaJn86
w3ho3GP9/6Ptq9n/A3c61itC2/bf0p5D/o/s/6qN3fqy/9/Fn23971naPfW/pZPejffuWHbLaCbn
b1n6e6x498XFuZdMX9k7Une5ylIkkc3Z6c6OulmrL0AyXzicbkR4dAM+AiXp1ZbPLe2pJR4s660Z
zdfP9Da3R+2fPlz4jYfATz//bTSqB9v87zna58lf3yamxy9Z4zH/v7d2/lPdP6hu/f9ztJOTt8fd
n5gJZ9R89Un5MrrsnjNOTnQpjjalCx2zfOD7Cv4htctGwvmen7dOu+2ry062k82UaDYGa3Vb15e9
hT5yg/9cXGA++Lp9dd3uvl8d3UCgUT63dd1udbDuBcCuDppE00BIdRHKHkvLRbyyrSgeDa2QyXg6
4pZD92MDi17ThdrAozuMUfqt4XO539+9rdr/yldaX2WNx85/9+u11fs/e429rf0/R3vJppbvlT0r
GCakCZJHt5QAvpL2iPvW0SiOQ9msVCJrYg6RDSX9BENs/YEmIoJfkS7diZSkORVtPOpRzy/jUdVr
DbI4ADZY9hFMk9X2DMNxZRwJKm/rJyP9Lqa58LEvRvGBhXxNFfHokmhazdNf/DZTmzWMWVd6tVeP
Ul9xZnRoGhTii5/4VtIZaoIu5GUFQxPZsCvpur9DZc21D4OfsMja3A3LUQBuzr93XZjxhIXW5t6z
UFnwpZ/6tGXpVcDjiYjoMvLSa5XYTsF2X86xXf5sezO+5lTYsYCr+cjt2BTRkF5WNkzf9M2vBklF
7eZan2F4wra8HmUpvbm2qaSc/VtNbF/+hJjRVeEp8ntEFxVzad1sSOfn9tveRat73Ptr+7rb6xxf
UgQ6/al1+nO2l4hpC6BQKW/45u33Nuht27Zt27Zt27Zt27Zt27Zt27Z72n8AUihMpwBQAAA=
--Apple-Mail=_7CA04D86-0F02-4C0A-AF5B-12023013CF55
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


>=20
> Bruce
>=20
>> 2/2 - image-oci: drop *-initial sysroot deps in do_image_oci to avoid
>>      libgcc collision
>>=20
>>  do_image_oci can abort with:
>>    ERROR: <recipe> do_image_oci: The file .../crtbegin.o is installed
>>    by both libgcc and libgcc-initial, aborting
>>=20
>>  Root cause is in extend_recipe_sysroot's dependency walk: the
>>  SSTATE_EXCLUDEDEPS_SYSROOT exclusion that normally keeps libgcc and
>>  libgcc-initial from landing in the same sysroot only applies when
>>  the *consuming* task is itself do_populate_sysroot. do_image_oci
>>  reaches extend_recipe_sysroot through the generic "any task whose
>>  [depends] contains populate_sysroot gets this prefunc" path
>>  (staging_taskhandler), so that exclusion never fires for it.
>>=20
>>  This one is sstate-state-dependent -- whether it fires depends on
>>  whether extend_recipe_sysroot's walk actually needs to populate (vs.
>>  skip via sstate/setscene shortcuts) both libgcc and libgcc-initial
>>  for a given recipe/build. A minimal single-package OCI recipe did
>>  not reach libgcc in our testing, but a multi-layer "packages:" =
recipe
>>  installing a from-source-compiled library with a moderately large
>>  DEPENDS (boost) did: instrumenting the fix confirms it stripping two
>>  "*-initial" do_populate_sysroot nodes out of BB_TASKDEPDATA for that
>>  recipe, i.e. libgcc-initial is a real, reachable node in
>>  do_image_oci's dependency walk for realistic recipes. We were not
>>  able to force the raw abort deterministically within our test
>>  window (a downstream build did hit it deterministically across 6+
>>  clean-sstate attempts on a wider dependency set) -- see the patch
>>  commit message and TEST-CASES.md for exactly what was and wasn't
>>  reproduced, and why the fix is justified regardless.
>>=20
>>=20
>> Signed-off-by: Koen Kooi <koen.kooi@oss.qualcomm.com>
>>=20
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#9990): =
https://lists.yoctoproject.org/g/meta-virtualization/message/9990
>> Mute This Topic: https://lists.yoctoproject.org/mt/120482430/1050810
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: =
https://lists.yoctoproject.org/g/meta-virtualization/unsub =
[bruce.ashfield@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>=20
>=20
>=20
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



--Apple-Mail=_7CA04D86-0F02-4C0A-AF5B-12023013CF55--

