Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F063BE00867; Mon, 27 Mar 2017 08:52:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.196 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.196 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BEA07E007AA
	for <meta-virtualization@yoctoproject.org>;
	Mon, 27 Mar 2017 08:52:08 -0700 (PDT)
Received: by mail-yw0-f196.google.com with SMTP id q20so3990279ywa.2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 27 Mar 2017 08:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=GESKMe4UJWkThrT5m9h81qaIItTG61A/EGn0Zq9MXU4=;
	b=XeQZw2r7Qvtduj5mP2dfitswh32O9wIui9A5RmBDUwux2IvlU37HzvvZFmbnGbTMFr
	MRBPKYT+OWZKcLafOfWE7UtxlbEHJHOAYaciq3j2K5NbV3dzzSQ59vjRCTjPc+CbwL0o
	dt5qee45aHfVXvpzWaywiBJ6RrPUpGw8rGDnJOYH68ZO+qMvza+3pTvzXJKZSSg/wyVj
	ONh066hO5sXpHtq8/StIokRNVjJg+uMXXbt4cqTVhzUsbo78gYp/6PI251myspYdLCAk
	HDDjjmpfeK/2mjiMHEZMKyjl0L+Gt6g4K0jzbWw8his6Pe3M9qAOB8gO14mmFRbX5GE9
	m1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc
	:content-transfer-encoding;
	bh=GESKMe4UJWkThrT5m9h81qaIItTG61A/EGn0Zq9MXU4=;
	b=COGUbs7H7XByQDldGyYjWMnenCL+X5OvIg+qnQwwyRk01+CrR2UAQLzFGpY87acRRO
	2Vavf5nZmDOAU6pJcIpYexaLVRDLEQjfj3ihkthko864yqzaYuDjq4tWgGIhs0UgROEE
	Gva1OD6hujvqmnImr8JJTa/608p3T2cXzwR9m/GttEa4B3BTmxrqEVydY2Ve63gz/NqO
	YVnZ+m//lQZ3CiqkdzQEFPLIFfcjqC4XKZK9C2lEIZgQSu0zE/RWOEMqkqn9Y54UpTp+
	MfJdB5AL76rRtvBi+Mg8ogFUSUTeGpUn6uO46QwWmw+dtv6ulDJ4LMJDwWqTQyTaUnpb
	V/nQ==
X-Gm-Message-State: AFeK/H0+4JgEiMx+1RPGIL2JgUveVCHYlmPTut0R8GHnXQx1xepa7UVYWUSctrBc/HGKe7POd7jOu8OKVsE5Uw==
X-Received: by 10.129.125.5 with SMTP id y5mr16926585ywc.120.1490629927445;
	Mon, 27 Mar 2017 08:52:07 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.49.194 with HTTP; Mon, 27 Mar 2017 08:52:06 -0700 (PDT)
In-Reply-To: <20170327064330.20815-1-jonatan.palsson@pelagicore.com>
References: <20170327064330.20815-1-jonatan.palsson@pelagicore.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Mon, 27 Mar 2017 11:52:06 -0400
X-Google-Sender-Auth: Op4nYruq5XUsQU-8ZgB3PMexoQE
Message-ID: <CAPuovEKh0pouVU0f_3+d08sp6vsoE+iurLpQ5DH5mMODoUqimw@mail.gmail.com>
To: =?UTF-8?Q?Jonatan_P=C3=A5lsson?= <jonatan.palsson@pelagicore.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] lxc: Add lua to PACKAGECONFIG
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Mar 2017 15:52:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 27, 2017 at 2:43 AM, Jonatan P=C3=A5lsson
<jonatan.palsson@pelagicore.com> wrote:
> Lua support is automatically enabled when configuring LXC if lua is
> available in the sysroot. The packaging step will fail since the lua
> related files are not in FILES.
>
> This patch explicitly enables/disables lua support using PACKAGECONFIG,
> and also adds lua-related files to FILES.
>
> Signed-off-by: Jonatan P=C3=A5lsson <jonatan.palsson@pelagicore.com>
> ---

This looks fine. I wasn't sure about the handling of the globbing in
${libdir}/lua/lxc but since -dbg comes first in the PACKAGES list it
is all good. This addresses a bug report we have in meta-overc which I
was just about to look at, thanks for getting this out first and
saving me some time.

Mark

>  recipes-containers/lxc/lxc_2.0.0.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/recipes-containers/lxc/lxc_2.0.0.bb b/recipes-containers/lxc=
/lxc_2.0.0.bb
> index 250ac4d..c98d1a7 100644
> --- a/recipes-containers/lxc/lxc_2.0.0.bb
> +++ b/recipes-containers/lxc/lxc_2.0.0.bb
> @@ -65,6 +65,7 @@ PACKAGECONFIG[templates] =3D ",,, ${PN}-templates"
>  PACKAGECONFIG[selinux] =3D "--enable-selinux,--disable-selinux,libselinu=
x,libselinux"
>  PACKAGECONFIG[seccomp] =3D"--enable-seccomp,--disable-seccomp,libseccomp=
,libseccomp"
>  PACKAGECONFIG[python] =3D "--enable-python,--disable-python,python3,pyth=
on3-core"
> +PACKAGECONFIG[lua] =3D "--enable-lua,--disable-lua,lua,lua"
>
>  # required by python3 to run setup.py
>  export BUILD_SYS
> @@ -86,6 +87,9 @@ FILES_${PN}-doc =3D "${mandir} ${infodir}"
>  # For LXC the docdir only contains example configuration files and shoul=
d be included in the lxc package
>  FILES_${PN} +=3D "${docdir}"
>  FILES_${PN} +=3D "${libdir}/python3*"
> +FILES_${PN} +=3D "${datadir}/lua/*"
> +FILES_${PN} +=3D "${libdir}/lua/lxc/*"
> +FILES_${PN}-dbg +=3D "${libdir}/lua/lxc/.debug"
>  FILES_${PN}-dbg +=3D "${libexecdir}/lxc/.debug ${libexecdir}/lxc/hooks/.=
debug"
>  PACKAGES =3D+ "${PN}-templates ${PN}-setup ${PN}-networking"
>  FILES_${PN}-templates +=3D "${datadir}/lxc/templates"
> --
> 2.10.2
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

