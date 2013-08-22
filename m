Return-Path: <victor.kamensky@linaro.org>
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C6909E0043C
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Aug 2013 17:46:44 -0700 (PDT)
Received: by mail-qc0-f173.google.com with SMTP id z10so659653qcx.18
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Aug 2013 17:46:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=16CiBO1IfINJWwsVxwvTPE2Uhvmmeq92pKsJnnAY1pI=;
	b=NsNKVJHF8kQIDMr7C1sormGQgcXa6Aq6kYFPzFKn7Liqa0Piz2DcmkqX958YFdCbAM
	tBGsmLTObn/5vZOyetdK6dVhx7nzTViBDAwGzgtTbNqrsr5JZX5kgLO4o3v0+iQ21MsZ
	Ma4Ru9WQdG+PJ1oKuPUFTDEF45Y/F2Q9fiAG6hqNGsRty85hhiB0tRKfmelNNhaVjlyu
	r6WqC3xf7g+MHSdlNNYe7gUYRnodZrHuauiuzhWUIFpX6LM+t3lUM7EYtjUk2Z76XZpN
	xEFpIC7AY0xrvI9yVyHPQBgE57ugYqliTHNhbJiNhktjiBY2GW3N0yPbt2cVX25czniI
	48Ig==
X-Gm-Message-State: ALoCoQl3rB2T8ldM0kzDTnqgxus7o4469Af47ZImZHnB0t2oBTRLzy2pi+UVoEG1Ie9iDfuXeY+5
MIME-Version: 1.0
X-Received: by 10.49.30.233 with SMTP id v9mr8905274qeh.80.1377132404046; Wed,
	21 Aug 2013 17:46:44 -0700 (PDT)
Received: by 10.229.193.71 with HTTP; Wed, 21 Aug 2013 17:46:43 -0700 (PDT)
In-Reply-To: <CAM1oe53TxnJzi0mtx+4NLZruC3kEX=OLjWVVfpoxUtcYpzrcgQ@mail.gmail.com>
References: <CAM1oe53TxnJzi0mtx+4NLZruC3kEX=OLjWVVfpoxUtcYpzrcgQ@mail.gmail.com>
Date: Wed, 21 Aug 2013 17:46:44 -0700
Message-ID: <CAA3XUr2CKHbT9rgF4+1-TQm1jCMoULFuETozOPgY8-RY=SV5-Q@mail.gmail.com>
From: Victor Kamensky <victor.kamensky@linaro.org>
To: Zi Shen Lim <zishen.lim@linaro.org>
X-Mailman-Approved-At: Thu, 29 Aug 2013 06:02:43 -0700
Cc: meta-virtualization@yoctoproject.org
Subject: Re: error triggered by meta-virtualization
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
X-List-Received-Date: Thu, 22 Aug 2013 00:46:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

Just to clarify a bit:

some preexisting layers in Zi's setup also had
python_2.7.3.bbappend with syntax like this

[kamensky@kamensky-w530 081913_1]$ cat
meta-linaro/meta-bigendian/recipes-devtools/python/python_2.7.3.bbappend
FILESEXTRAPATHS := "${THISDIR}/${PN}"

SRC_URI += "file://python_ffi_armeb_be8.patch"

We are wondering why
meta-virtualization/recipes-devtools/python/python_2.7.3.bbappend
redefines FILESPATH in such unusual way, which results that another layer
modification got wiped out. Also it seems that
meta-virtualization/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
patch
already exist in OE defined layer
(poky/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch).
With your python_2.7.3.bbappend you make it pick up yours. It is highly
unusual for OE system. Patches are different just a bit:

[kamensky@kamensky-w530 081913_1]$ diff
meta-virtualization/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
poky/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
122,124c122,124
< +        lib_dirs = [ os.getenv( "STAGING_LIBDIR" ) ]
< +        inc_dirs = [ os.getenv( "STAGING_INCDIR" ) ]
< +        lib_dirs += os.getenv('LIBRARY_PATH', '').split(os.pathsep)
---
> +        lib_dirs = [ os.getenv("STAGING_LIBDIR"),  os.getenv("STAGING_BASELIBDIR") ]
> +        inc_dirs = [ os.getenv("STAGING_INCDIR") ]
> +

If you are unhappy with OE provided
01-use-proper-tools-for-cross-build.patch patch patch you
could come up with new patch on top of it, but not instead.

Does this python_2.7.3.bbappend even really needed or it is artifact
of some things in the past?

Thanks,
Victor

On 21 August 2013 16:22, Zi Shen Lim <zishen.lim@linaro.org> wrote:
> Hi,
>
> After adding meta-virtualization layer into bblayers.conf, I'm not
> able to build packages.
> Looks like the search path is broken [1].
>
> As a quick workaround, I removed
> meta-virtualization/recipes-devtools/python/python_2.7.3.bbappend.
> That resolved the issue.
>
> Suggestions?
>
> Thanks,
> z
>
> [1] http://pastebin.com/BmK4QnnE

