Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 89C8DE00D30; Thu, 25 Jul 2019 11:26:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0511AE00C22
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Jul 2019 11:26:30 -0700 (PDT)
Received: by mail-lj1-f195.google.com with SMTP id x25so49001262ljh.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Jul 2019 11:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JkLwpuolTXYG3k48ZnJ/W9SeZFyWNOXeINZE4vnMUtk=;
	b=nf5WT0A/XLrHUZDaneCRDeaysvblTOXLWtdBN3SYKDHCvBpD6STD/+6BZ3+gWbkngG
	BaMgAlhDzBTlJakAusUfFAHKFQ10QjFV7Xy/WKMWNcRKP4nmBk3+PAfE2i/2FilmajS8
	UrZfTbDiajpscWb9eKnGEz70uh1r49C6ypb7If8YABcIjz9QF1llr/156Jm27Syf/LdH
	i9k/GTJ0C0r7soC6YPM0AXvwmuQgRCtUxTzBnU+GVi+Y6Hgn+4vyuSQ3tH6X/YTDYBIx
	6AABnqFewP3FtjY6GBAIf77lP4u3AYCK7TMQOycvDhKzyz/BHCQQrCryCbFl5PGkCerG
	3sMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JkLwpuolTXYG3k48ZnJ/W9SeZFyWNOXeINZE4vnMUtk=;
	b=t8rKSNSkLgFDij6WvDMpNkpwlKpbf7lDhW6RP1e4dXWiahUnxG8Q7r5cb/i+dklmuH
	UB1fgyLDmgTLZb9w5s+xXYQ53MHF8EKnim2eocN5KtKbYfNEngAN38uGcGjWdmkKMc2t
	2QlVybQwcywnTtZ+QBbUgOhN6SBGCS4c40cQ+3JJA8Ce6L3uftgRe9CtJ2hnluV2sDNg
	5ddWv7MIFC/jetYcM6NCmEl7ktGnfq5kpcLgyOmkWQ6ewW/9CCpcNXQzGo1E92oVKduT
	cEcEqsmS60oux6dUz7mD+WSblkGaq7h0FIkCfk7B8UOCSklA8lwq/IdI1fuu9eVDoMvx
	12iw==
X-Gm-Message-State: APjAAAXKYtlhqHMSv/3Q/XXiHz3hqHY13wVpC3KKojYOPID8hFNbTNao
	1BVdsp60ZvEiHgKKP1SCz0ZuiP8f33WZn6JFr1y8EREdQI8=
X-Google-Smtp-Source: APXvYqxfN9FqLCEqpeiC6+EFDPPTf3gGfeF2UTBybhUheAlgdOIoapQEbl5LSm58wLZl+Xsqrl0HMmMHXjX7Tmz+RVA=
X-Received: by 2002:a2e:3807:: with SMTP id f7mr32662434lja.87.1564079189741; 
	Thu, 25 Jul 2019 11:26:29 -0700 (PDT)
MIME-Version: 1.0
References: <1563954182-300270-1-git-send-email-zhe.he@windriver.com>
In-Reply-To: <1563954182-300270-1-git-send-email-zhe.he@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 25 Jul 2019 14:26:18 -0400
Message-ID: <CADkTA4OpE+dxWX15s=eHevy7OCLVP5iBrDNC98P5K4AW+yOE=g@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] libvirt: Do not change /var/lib/libvirt/qemu for mips and mips64 in do_install
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
X-List-Received-Date: Thu, 25 Jul 2019 18:26:31 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Wed, Jul 24, 2019 at 3:43 AM <zhe.he@windriver.com> wrote:
>
> From: He Zhe <zhe.he@windriver.com>
>
> qemu does not support mips and mips64 and thus /var/lib/libvirt/qemu is not
> generated. Do not change it.
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_5.5.0.bb | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_5.5.0.bb b/recipes-extended/libvirt/libvirt_5.5.0.bb
> index 8d71862..80f7a6c 100644
> --- a/recipes-extended/libvirt/libvirt_5.5.0.bb
> +++ b/recipes-extended/libvirt/libvirt_5.5.0.bb
> @@ -311,9 +311,18 @@ do_install_append() {
>
>         sed -i -e 's/^\(unix_sock_group\ =\ \).*/\1"kvm"/' ${D}/etc/libvirt/libvirtd.conf
>         sed -i -e 's/^\(unix_sock_rw_perms\ =\ \).*/\1"0776"/' ${D}/etc/libvirt/libvirtd.conf
> -       chown -R qemu:qemu ${D}/${localstatedir}/lib/libvirt/qemu
> -       echo "d qemu qemu 0755 ${localstatedir}/cache/libvirt/qemu none" \
> -            >> ${D}${sysconfdir}/default/volatiles/99_libvirt
> +
> +       case ${MACHINE_ARCH} in
> +               *mips*)
> +                       break
> +                       ;;
> +               *)
> +                       chown -R qemu:qemu ${D}/${localstatedir}/lib/libvirt/qemu
> +                       echo "d qemu qemu 0755 ${localstatedir}/cache/libvirt/qemu none" \
> +                           >> ${D}${sysconfdir}/default/volatiles/99_libvirt
> +                       break
> +                       ;;
> +       esac
>
>         if ${@bb.utils.contains('PACKAGECONFIG','gnutls','true','false',d)}; then
>             # Generate sample keys and certificates.
> --
> 2.7.4
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

