Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E70F9E0093B; Tue, 11 Sep 2018 13:06:50 -0700 (PDT)
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
	*      [209.85.167.68 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ABA42E00566
	for <meta-virtualization@yoctoproject.org>;
	Tue, 11 Sep 2018 13:06:49 -0700 (PDT)
Received: by mail-lf1-f68.google.com with SMTP id e23-v6so21390956lfc.13
	for <meta-virtualization@yoctoproject.org>;
	Tue, 11 Sep 2018 13:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=c2Pns589OE2jO+TRyvkJKdEPZPnZ+1q3d5PABxsgaQo=;
	b=O5pZMmD7jHSshREqUoZK9J7vgHXaFEf/JE3yO5SsFu4v0MwAYlmPLj2jAACR6UznjX
	KotrfZmg9RGk6EFVxSNeVYqoA908aecvDCEzoj9wC5dmd61JsOxrQc6zMqN0KoAIcYis
	yZi0yz9ZDeW0ceHHApZLruBuor+My+R40hxgo0g3hSKpr9XrHbqLsJ71FLNppoToPHnd
	k8M506/8Q3GPatSUYX1Bpwvozd7LXmKw4GK74rvFwGEsdYpFpSr90S48jvJ+0DuLDrgj
	Z8yWHnIkLqIVceYbZFi60mRKMOg7b22K2HTGQ2H5omOOd7/7BYuWThtxmRZlckNBLrXt
	flBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=c2Pns589OE2jO+TRyvkJKdEPZPnZ+1q3d5PABxsgaQo=;
	b=Us/uEmMu2bTB0PbMyusa+0ipLNeYaWUX2EuqbcaDvm+XZuhcOnlUxH7oZbqNxYU3B/
	1CZEarNySpVYBLgFtGnwlTPS+UMGVfiV4zOPTxluxNnCLd5A1wUxrmxDlIHs7zyaRpyc
	IcZidl54NsP8wAF+7yYK3cuLgB9dzI5Ev7V2acsWi/poZOE2aEENs+auTjTG5AVa5d9D
	KxqcDB2UY1ol8YMjO7e5H6xadYkzD5/3/RNuV57DlFTyPyKdIhYFElIbJkUJiWIHLVyQ
	98iILU7BvjEVGcG6+ig0pffSFTpgWowr9DpuO61CSgkNVGTmnWAM0OSrMFMrCc2LkWu+
	9m6w==
X-Gm-Message-State: APzg51BCBsGCuz3OZk72S/BEPzHaGOlvcWiin0E97tZdkyvRgJUXvtN8
	DLjsObbxU7Bg+XYtBY6Rs7++W91gOc1H11YO7pGOEQ==
X-Google-Smtp-Source: ANB0Vda44YvKL3Q+xh9dfCVjoPD3zZ0AeMmz3bOqEulSO0VwAda+nzeoPB9tfPSFyp812B6YrerrOq/AIemiphla4+s=
X-Received: by 2002:a19:6b0b:: with SMTP id
	d11-v6mr9764017lfa.99.1536696408494; 
	Tue, 11 Sep 2018 13:06:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:86c9:0:0:0:0:0 with HTTP; Tue, 11 Sep 2018 13:06:47
	-0700 (PDT)
In-Reply-To: <1536659289-356263-1-git-send-email-zhe.he@windriver.com>
References: <1536659289-356263-1-git-send-email-zhe.he@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 11 Sep 2018 16:06:47 -0400
Message-ID: <CADkTA4PoXbWq10WxjZ7k_dM7CO-5dHpcD+wDbh_qYuqb=o8rww@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] lxc: Make named avoid listening on lxc network interface
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
X-List-Received-Date: Tue, 11 Sep 2018 20:06:51 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Tue, Sep 11, 2018 at 5:48 AM,  <zhe.he@windriver.com> wrote:
> From: He Zhe <zhe.he@windriver.com>
>
> lxc-net wants to take care of DNS itself using dnsmasq, while named in
> bind does the same thing on all network interfaces by default and causes
> the following error.
>
> dnsmasq: failed to create listening socket for 10.0.3.1: Address already in use
> Failed to setup lxc-net.
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  recipes-core/bind/bind_%.bbappend         | 1 +
>  recipes-core/bind/bind_virtualization.inc | 4 ++++
>  2 files changed, 5 insertions(+)
>  create mode 100644 recipes-core/bind/bind_%.bbappend
>  create mode 100644 recipes-core/bind/bind_virtualization.inc
>
> diff --git a/recipes-core/bind/bind_%.bbappend b/recipes-core/bind/bind_%.bbappend
> new file mode 100644
> index 0000000..617cacc
> --- /dev/null
> +++ b/recipes-core/bind/bind_%.bbappend
> @@ -0,0 +1 @@
> +require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', '${BPN}_virtualization.inc', '', d)}
> diff --git a/recipes-core/bind/bind_virtualization.inc b/recipes-core/bind/bind_virtualization.inc
> new file mode 100644
> index 0000000..b8f0b3f
> --- /dev/null
> +++ b/recipes-core/bind/bind_virtualization.inc
> @@ -0,0 +1,4 @@
> +# Tell named not to bother listening on the IP address that lxc handles itself.
> +do_install_append() {
> +       sed -i -e 's,^\( *options *{\)$,\1\n\t// lxc would take care of this address itself\n\tlisten-on { ! 10.0.3.1; any;};\n,' ${D}${sysconfdir}/bind/named.conf.options
> +}
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

