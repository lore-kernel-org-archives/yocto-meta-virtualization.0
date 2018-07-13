Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8CF9EE011FF; Fri, 13 Jul 2018 10:45:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.215.68 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E45B0E00C88
	for <meta-virtualization@yoctoproject.org>;
	Fri, 13 Jul 2018 10:45:12 -0700 (PDT)
Received: by mail-lf0-f68.google.com with SMTP id n96-v6so27812204lfi.1
	for <meta-virtualization@yoctoproject.org>;
	Fri, 13 Jul 2018 10:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Xfja3in9TP1MOLGTwMmsSE+vCBo2wEmLtq46HavfcbI=;
	b=VQ18hjrXWD3oJ0VhHcuwd/VlCwuFQdQwz0arSZVB4wgKivsRMCzeIPlif8gKLSeIn4
	4ioFd+sQob+Ps+6xezadV/yjC3Mo2zzBtdU2WFxTyPA9OKkC5G9poLW3gFtuRzZxbBnw
	ydIzKMnw73emUdWGl8QPJGJJGk8iE1gS6YPSLMwQZNtKCVYe+5gCt9gYbgxYr8HzDgpY
	SP6VjDuIy55z7a24gZZD1SthjNCUGt5FjLLmCpZxwcKPgnkbtu3mLdKzggQ3+UAeMhPw
	tvwz8bAMOtBG9vCE4LnXdJeZd+i6Q8bV0zTCESYZ+ZAC6oOAH8fIBirq4Xl9TRldxBfL
	bvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Xfja3in9TP1MOLGTwMmsSE+vCBo2wEmLtq46HavfcbI=;
	b=HqUkNmvU5yNRxnOPLbR7nMuVXs2QIbyjnou8zbMXWhIsgZ7xB/sDljU2AVAYyTnGey
	hD33oXlz7GvFXRv6eAuEIWbuuhOb39kP/BPyOphQHS0/I7PLpO6H/1Y71JkQ7ELStHKl
	ZDLMOAj2nMj670YVtdg3CglB0zd/h1jFIJHJ/ZSZxMG0lmMqwr2Wpw9vPSVApv0y5ghi
	irtVIWO53YOHrnrpy/6PyUHhy/UoYK5Xu/b3UAwTYD9z5jJXXE725sWidzJN+QQ81CEh
	hYgn8ZBAam+Ru1tokjs1lC8nAU4N6/IJD2NiDckBdgx1otatQirlErnlPALinEpH6vV3
	y1XA==
X-Gm-Message-State: AOUpUlEJ3iBKjMgz+BYm/NQ96vNeJWkCry4dIcKxTNfii3llJ+nPKXH+
	v3EHHRtWowVqupU931esier7IWdDl/jHMH+ILyQ=
X-Google-Smtp-Source: AAOMgpeBQpPArz7p+TXXiu7oWL1rqhdh2PuaHyfCg15mE2V7piBs6vsbarR9h7OIMGkEY9XkGu6pQOCRQhvwM9lsRH8=
X-Received: by 2002:a19:c403:: with SMTP id u3-v6mr5463204lff.87.1531503911875;
	Fri, 13 Jul 2018 10:45:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9acd:0:0:0:0:0 with HTTP; Fri, 13 Jul 2018 10:45:11
	-0700 (PDT)
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF738709B5B4@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1530707794-106222-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CADkTA4NCdxU5OYwNHMoDSyw=1MupjfC=RdgEVeTwaJHGkC1qJQ@mail.gmail.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF738709B5B4@G08CNEXMBPEKD01.g08.fujitsu.local>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 13 Jul 2018 13:45:11 -0400
Message-ID: <CADkTA4Pb27qJur1gWVphPWmrVXzBUpSB5A9r_pGtOo8766yGgw@mail.gmail.com>
To: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] [PATCH] criu: upgrade to 3.9
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Jul 2018 17:45:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sounds good.

Can you send a v2 patch with that information captured in the long log ?

Bruce

On Thu, Jul 12, 2018 at 9:26 PM, Zheng, Ruoqin
<zhengrq.fnst@cn.fujitsu.com> wrote:
> Hi Bruce
>
> 1 >fix-building-on-newest-glibc-and-kernel.patch
> This patch is removed for it has been merged  in upstream.
>
> 2 > +CFLAGS_arm +=3D "-D__WORDSIZE"
> I add this CFLAGS to solve the compile problem for arm.
>
> The log is as following:
> | ....../tmp/work/armv5e-poky-linux-gnueabi/criu/3.4+gitAUTOINC+a31c1854e=
1-r0/recipe-sysroot/usr/include/bits/wordsize.h:36:2: error: #error "__WORD=
SIZE is not defined"
> |  #error "__WORDSIZE is not defined"
> |   ^
> | ....../tmp/work/armv5e-poky-linux-gnueabi/criu/3.4+gitAUTOINC+a31c1854e=
1-r0/recipe-sysroot/usr/include/bits/wordsize.h:59:2: error: #error "Unknow=
n __WORDSIZE detected"
> |  #error "Unknown __WORDSIZE detected"
>
> 3 > +export C_INCLUDE_PATH=3D"${STAGING_INCDIR}/libnl3"
> I add C_INCLUDE_PATH to solve the compile problem for arm.
> The problem is that libnetlink.c can't find head file.
>
> | In file included from criu/libnetlink.c:5:
> | ....../tmp/work/armv5e-p
> | oky-linux-gnueabi/criu/3.9+gitAUTOINC+202b7745bd-r0/recipe-sysroot/usr/=
include/libnl3/netlink/attr.h:15:10: fatal error: netlink/netlink.h: No suc=
h file or directory  #include <netlink/netlink.h>
> |           ^~~~~~~~~~~~~~~~~~~
>
>
> --------------------------------------------------
> Zheng Ruoqin
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST)
> ADDR.: No.6 Wenzhu Road, Software Avenue,
>        Nanjing, 210012, China
> MAIL : zhengrq.fnst@cn.fujistu.com
>
>
> -----Original Message-----
> From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
> Sent: Tuesday, July 10, 2018 9:43 PM
> To: Zheng, Ruoqin/=E9=83=91 =E8=8B=A5=E9=92=A6 <zhengrq.fnst@cn.fujitsu.c=
om>
> Cc: meta-virtualization@yoctoproject.org
> Subject: Re: [meta-virtualization] [PATCH] [PATCH] criu: upgrade to 3.9
>
> Thanks for the uprev, but I have a few questions below.
>
> On Wed, Jul 4, 2018 at 8:36 AM, Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com=
> wrote:
>> Upgrade criu from 3.4 to 3.9.
>>
>> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
>> ---
>>  recipes-containers/criu/{criu_git.bb =3D> criu_3.9.bb} | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)  rename
>> recipes-containers/criu/{criu_git.bb =3D> criu_3.9.bb} (94%)
>>
>> diff --git a/recipes-containers/criu/criu_git.bb
>> b/recipes-containers/criu/criu_3.9.bb
>> similarity index 94%
>> rename from recipes-containers/criu/criu_git.bb
>> rename to recipes-containers/criu/criu_3.9.bb
>> index 7d62f35..36c356d 100644
>> --- a/recipes-containers/criu/criu_git.bb
>> +++ b/recipes-containers/criu/criu_3.9.bb
>> @@ -13,15 +13,14 @@ EXCLUDE_FROM_WORLD =3D "1"
>>
>>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D412de458544c1cb6a2b512cd3992=
86e2"
>>
>> -SRCREV =3D "a31c1854e10580a09621e539c3ec052b875a8e06"
>> -PV =3D "3.4+git${SRCPV}"
>> +SRCREV =3D "202b7745bd0c37a1732ebe2fb009a157d338bf95"
>> +PV =3D "3.9+git${SRCPV}"
>>
>>  SRC_URI =3D "git://github.com/xemul/criu.git;protocol=3Dgit \
>>             file://0001-criu-Fix-toolchain-hardcode.patch \
>>             file://0002-criu-Skip-documentation-install.patch \
>>             file://0001-criu-Change-libraries-install-directory.patch \
>>             file://lib-Makefile-overwrite-install-lib-to-allow-multiarc.=
patch \
>> -           file://fix-building-on-newest-glibc-and-kernel.patch \
>
> I see this patch being removed from the SRC_URI, but not the delete of th=
e patch, or an explanation of why it is no longer required.
>
>>            "
>>
>>  COMPATIBLE_HOST =3D "(x86_64|arm|aarch64).*-linux"
>> @@ -46,9 +45,11 @@ EXTRA_OEMAKE_append +=3D "LOGROTATEDIR=3D${sysconfdir=
}
>> SYSTEMDUNITDIR=3D${systemd_unit  CFLAGS +=3D "-D__USE_GNU -D_GNU_SOURCE =
"
>>
>>  CFLAGS +=3D " -I${STAGING_INCDIR} -I${STAGING_INCDIR}/libnl3"
>> +CFLAGS_arm +=3D "-D__WORDSIZE"
>
> Can we document why this is required, and what the error is without it ?
>
>>
>>  # overide LDFLAGS to allow criu to build without: "x86_64-poky-linux-ld=
: unrecognized option '-Wl,-O1'"
>>  export LDFLAGS=3D""
>> +export C_INCLUDE_PATH=3D"${STAGING_INCDIR}/libnl3"
>
> Likewise, we need to document why this is now required.
>
> Cheers,
>
> Bruce
>
>>
>>  export BUILD_SYS
>>  export HOST_SYS
>> --
>> 2.7.4
>>
>>
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee=
 at its end"
>
>
>
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

