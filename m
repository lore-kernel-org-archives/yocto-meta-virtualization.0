Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8B236E00C43; Wed,  6 Feb 2019 12:54:16 -0800 (PST)
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1AC5CE00C06
	for <meta-virtualization@yoctoproject.org>;
	Wed,  6 Feb 2019 12:54:14 -0800 (PST)
Received: by mail-lj1-f196.google.com with SMTP id j1-v6so3431552lja.8
	for <meta-virtualization@yoctoproject.org>;
	Wed, 06 Feb 2019 12:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=j+eoyYvUMN9HmPVd+IAJq3XnKiIsK8vzfkfDHpbjkmY=;
	b=gVq3DCrr0cEUaZ2hqA1lxNrx/spPJBfQBi24TKTqqLL9swX3zlpNwNVyYE5h57OJqe
	DLQaWVQT0tOVphcNbuXP6jGkv65EX8A8RI+uqpuYLzViMVzqr7U5xfdYoz4qRE3hwIQo
	bBmKtYxVW4N1nqpcxwRmD1RISUIW/skQ2mlFK+c7XTwiSXekM/v0kFtEk775R/mEngXu
	qIvQJ149/pD5W5jLPq83ZktoRrkm17K9J8qgr2Ox+Jx164ioGEm2I0e/IcZlUFeifkZd
	CpS16tmHHbNtYwsvlJ5vihZTVDWSSMBHDU9haxxLvUOMrktWDtuTxGXvErhkDH3U3iw6
	xNtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=j+eoyYvUMN9HmPVd+IAJq3XnKiIsK8vzfkfDHpbjkmY=;
	b=WSTXQ/otoW8pE+WpizpHh4LFQgY4ouafsMZMIYcaVftEFMpRXlurOLjX0KHOq0X9FB
	nOwByIclPNZAfzJupBquQ7Qd4GGyrECt5r697UcYUgZwuE9hX2i7vOc/+IBnROPrhkkh
	pv6drlpxxPBRW7J1S0tnnDCbnMQwJcWeO1rWfMzt+VCsYgzkLSe6x3TaM/Rqm0Qh9Fut
	INpzHrzuP1ThLdOqVauZ/vdPINO3CjTUHUiobFIG3RUtSaF25IdyhliJMdMmV5KqtWyo
	3N7kCT1LO8+kW262L9C9Yqvu+X0XnxlLcqqLVvDEljoBHZP6vdaqRx3Czp4DVIlnNHTR
	O9VQ==
X-Gm-Message-State: AHQUAuZ2KwSN6Qnbh+ESlqy6bpnkE8x2DXLq3dIlR4cJNG37LOaBggP1
	ol3RefbtzgD3Aw56rBulZcYsM+FauD8ebF+lX/EwZ6zo
X-Google-Smtp-Source: AHgI3IbpsNENgTw0aFje+gdpYIthEAvnxv6Bd1KBmvgNH5pCnZKijuUtpJeKLHs65KYxlZjY2XcNKmNEDa+tQd4e2d0=
X-Received: by 2002:a2e:4784:: with SMTP id
	u126-v6mr7536410lja.124.1549486453774; 
	Wed, 06 Feb 2019 12:54:13 -0800 (PST)
MIME-Version: 1.0
References: <1549300087-30904-1-git-send-email-cjp256@gmail.com>
In-Reply-To: <1549300087-30904-1-git-send-email-cjp256@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 6 Feb 2019 15:54:02 -0500
Message-ID: <CADkTA4Oj9ddL6GtgXbLajyjZTSrbxPaMOFxJP8x12+L92sNQ-w@mail.gmail.com>
To: Chris Patterson <cjp256@gmail.com>
Cc: meta-virtualization@yoctoproject.org,
	Chris Patterson <pattersonc@ainfosec.com>
Subject: Re: [PATCH] libvirt: fix dependency for libxl
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
X-List-Received-Date: Wed, 06 Feb 2019 20:54:16 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Mon, Feb 4, 2019 at 12:08 PM Chris Patterson <cjp256@gmail.com> wrote:
>
> From: Chris Patterson <pattersonc@ainfosec.com>
>
> "libxl" package does not exist, use Xen.
>
> Signed-off-by: Chris Patterson <pattersonc@ainfosec.com>
> ---
>  recipes-extended/libvirt/libvirt_4.9.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_4.9.0.bb b/recipes-extended/libvirt/libvirt_4.9.0.bb
> index 768cf0e..ccd4f83 100644
> --- a/recipes-extended/libvirt/libvirt_4.9.0.bb
> +++ b/recipes-extended/libvirt/libvirt_4.9.0.bb
> @@ -194,7 +194,7 @@ PACKAGECONFIG_remove_mipsarchn64 = "qemu"
>  PACKAGECONFIG[qemu] = "--with-qemu,--without-qemu,qemu,"
>  PACKAGECONFIG[yajl] = "--with-yajl,--without-yajl,yajl,yajl"
>  PACKAGECONFIG[xenapi] = "--with-xenapi,--without-xenapi,,"
> -PACKAGECONFIG[libxl] = "--with-libxl=${STAGING_DIR_TARGET}/lib,--without-libxl,libxl,"
> +PACKAGECONFIG[libxl] = "--with-libxl=${STAGING_DIR_TARGET}/lib,--without-libxl,xen,"
>  PACKAGECONFIG[uml] = "--with-uml, --without-uml,,"
>  PACKAGECONFIG[openvz] = "--with-openvz,--without-openvz,,"
>  PACKAGECONFIG[vmware] = "--with-vmware,--without-vmware,,"
> --
> 2.1.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

