Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1B902E006B3; Tue, 14 Aug 2018 09:55:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 281DBE0049F
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Aug 2018 09:55:41 -0700 (PDT)
Received: by mail-lj1-f196.google.com with SMTP id f8-v6so15958675ljk.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Aug 2018 09:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DSyAYiMcUGPVOVVFPEYijl2U5oflXAmPuGW5SQuzhcY=;
	b=ezO47+CPOYJoSJYw1Nsg8Sm6epD6LZb3mdtgEwa/DE+ujvFc80VIsH3nWWH8y2e+lR
	KmyHJcJYFViJvrAGGZXVqwPXl/5r6qHEC+5SY+193v0341mj9dZTml/H6CbZqYISsx8x
	NsGsAHkoUP3DsXQhj42QsUtG9j/zouteZkBbIr56sfaJiXEzcgG5Rg98Ex7Lk5Bi4+0z
	81kyim074L0NSIkP90pQuN98WqjcqxHuPRhCGiARVfTJanmB+alYOv9UEaoLWfg0oKre
	ffwA0CfgFbB+u4fJcxRXyZy20ERWlCakRKc5ugNwF7qGloEFZXu/38QqQE+2fdzpkPdB
	Ex8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DSyAYiMcUGPVOVVFPEYijl2U5oflXAmPuGW5SQuzhcY=;
	b=dHZod46xpklctXcOiLIhqEvRaZ0jzc7eK7o2aPqacR+buA1xUwZ8W+dpr6lbbEML0T
	1nsCD2sJIG0ua9e9+r4mk6JnOcDVNHSI63jhdLe14rpcdVqlu408pJ9EMYHATHQgS0AF
	BPUdmuONJg1ap+ph+mDCpALb+AdskNYmXsXHjx12QhqGgkAsoVdJj1oZDTw17QgkrUXB
	nmm/2CQR68UBdQbDMGXLJheBs8lHxeIxWfT0s0LTQ4vFqVMSpY0tOhAcD77xZggdWT2m
	36nBB3BJTiMr/6WJiwPSkgTNs7IGnAkiJo2Szf8IXJEoLVi+Ed/HgC+WlvIQ8/jsw+RX
	2Bwg==
X-Gm-Message-State: AOUpUlFRPAJW87aWY3Jxf4FnjjR4ZR91hkPtBPendqa/jfgF5vzbaptl
	SDffOVuLrob9b92Sl7C0aLcDoy1OUgs2oDzRWRQ=
X-Google-Smtp-Source: AA+uWPyuVnyAPmZR2grVp9kAqZOZ5CKGVIiXVqEHH0FeIkvMQgm6mfl37HjZXNZWChUsy70LtLmQBok5G3Odagp3830=
X-Received: by 2002:a2e:504d:: with SMTP id
	v13-v6mr15413167ljd.84.1534265740041; 
	Tue, 14 Aug 2018 09:55:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9acd:0:0:0:0:0 with HTTP; Tue, 14 Aug 2018 09:55:39
	-0700 (PDT)
In-Reply-To: <1534125326-21302-1-git-send-email-christopher.w.clark@gmail.com>
References: <1534125326-21302-1-git-send-email-christopher.w.clark@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 14 Aug 2018 12:55:39 -0400
Message-ID: <CADkTA4OYyy4KuB9LWSSPqjB0L9TbksZivuNxag+QPH_LSbh9eQ@mail.gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@yoctoproject.org, Doug Goldstein <cardoe@gentoo.org>
Subject: Re: [PATCH] Xen: improve build reproducibility
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
X-List-Received-Date: Tue, 14 Aug 2018 16:55:42 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Sun, Aug 12, 2018 at 9:55 PM, Christopher Clark
<christopher.w.clark@gmail.com> wrote:
> Enable reproducible builds of the hypervisor binaries by defining
> build variables and setting compiler flags to support this.
>
> Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> ---
>  recipes-extended/xen/xen.inc | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index 4894c77..38cecd1 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -870,6 +870,24 @@ EXTRA_OEMAKE += "ETHERBOOT_ROMS=${STAGING_DIR_HOST}/usr/share/firmware/rtl8139.r
>  EXTRA_OEMAKE += "WGET=/bin/false"
>  EXTRA_OEMAKE += "GIT=/bin/false"
>
> +# Improve build reproducibility: provide values for build variables.
> +def get_build_time_vars(d):
> +    source_date_epoch = d.getVar('SOURCE_DATE_EPOCH')
> +    if source_date_epoch is not None:
> +        import datetime
> +        utc_datetime = datetime.datetime.utcfromtimestamp(float(source_date_epoch))
> +        return " XEN_BUILD_DATE=" + utc_datetime.strftime("%Y-%m-%d") + \
> +               " XEN_BUILD_TIME=" + utc_datetime.strftime("%H:%M:%S")
> +    return ""
> +EXTRA_OEMAKE += "${@['', 'XEN_WHOAMI=${PF} XEN_DOMAIN=${DISTRO} XEN_BUILD_HOST=${PN}-buildhost'] \
> +                    [d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1']}${@get_build_time_vars(d)}"
> +
> +# Improve build reproducibility: compiler flags to remove filesystem differences.
> +# Suppress __FILE__ via an alternative builtin.
> +CC += "${@['', '-gno-record-gcc-switches -Wno-builtin-macro-redefined -D__FILE__=__VERSION__ ' + \
> +               '-fdebug-prefix-map=${WORKDIR}=${PN}'] \
> +          [d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1']}"
> +
>  # check for XSM in package config to allow XSM_ENABLE to be set
>  python () {
>      pkgconfig = d.getVar('PACKAGECONFIG')
> @@ -889,6 +907,15 @@ do_post_patch() {
>
>      # libsystemd-daemon -> libsystemd for newer systemd versions
>      sed -i 's#libsystemd-daemon#libsystemd#' ${S}/tools/configure
> +
> +    # Improve build reproducibility: disable insertion of the build timestamp
> +    # into the x86 EFI hypervisor binary.
> +    # binutils should allow a user-supplied timestamp or use SOURCE_DATE_EPOCH
> +    # for PE but currently does not.
> +    if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ] ; then
> +        sed '/^EFI_LDFLAGS = /{a EFI_LDFLAGS += --no-insert-timestamp
> +}' -i "${S}/xen/arch/x86/Makefile"
> +    fi
>  }
>
>  addtask post_patch after do_patch before do_configure
> --
> 2.7.4
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

