Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C60BEE009C2; Wed,  8 Feb 2017 06:15:39 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.161.193 listed in list.dnswl.org]
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9C40BE009E2
	for <meta-virtualization@yoctoproject.org>;
	Wed,  8 Feb 2017 06:15:34 -0800 (PST)
Received: by mail-yw0-f193.google.com with SMTP id v73so11971069ywg.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 08 Feb 2017 06:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+QwhphGTwmzSanjT9Mh8eH3oKFjYjGYhaQdXw3djeBs=;
	b=iGH7ktKlEATYRILLkm++cqtOeYCLdVstsfyLGnLL/l4AGIYyUcKrM9Sne1do3JwwYk
	9beAaXSm54pvyhNyr4+5/LdfsBOzJaO6nEv6hTr5J/ADQaRD391x0xzULhGvUNRasoMT
	ZjE7rPXXF/juqbnxv7dOLuvujhTgLthvaynFefFPbH8k72Keg2iD6NSc2IbGjztP4ckA
	OEyFuecGqg/4gd3rkOFEWVRQsoVX9+WTI88epDCOyNBqFSb8ohvG2dwIGE1qFzbc/bOx
	8SQuH2DLic8KqK02iRVkRlyRBJ41TmKT8ZldJGXCb4ccsjp777+5w/aTGZvERF8ceOhv
	h0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=+QwhphGTwmzSanjT9Mh8eH3oKFjYjGYhaQdXw3djeBs=;
	b=BJSQzVIFfXkKUcfHu0y/465kuKvsPWfCKJCXeTWCrn6mhBzikrJCTFBcTx7mXr2c74
	Mk/YfeCjRadVTasjXDIsmcpGErhnm+h4mbtLrkJppV7qS1L7jD6fShz+fAni0had4XPf
	TiMMAX/+PPiYO9/EXfJYn2E5AxklSuz6MNPFD7/HPEm3phClDkWr+Ax0fZugBUreJt+0
	QPiYJDC+JZXm8bQ9sza9kAsnWMgw/tIri1EFEUZBFEsTfvFz3IK6/r6Qt2lgP4+hXgra
	4ff77t2avg3DPNksiNnV3n+wb+atqOlrm8tIOmlC6r9Drs9i3HOJ3PSz0XDzo9lom2Au
	+9+g==
X-Gm-Message-State: AIkVDXLFowrEThKMIzY174TJnF404anlpy9UCej5d93pfoAkbeqopW89PVfmuyNeaq0WgWL6lr0wLnBDgGOqPg==
X-Received: by 10.129.207.4 with SMTP id u4mr17038806ywi.12.1486563333471;
	Wed, 08 Feb 2017 06:15:33 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.21.66 with HTTP; Wed, 8 Feb 2017 06:15:33 -0800 (PST)
In-Reply-To: <1486561594-24053-4-git-send-email-amarnath.valluri@intel.com>
References: <1486561594-24053-1-git-send-email-amarnath.valluri@intel.com>
	<1486561594-24053-4-git-send-email-amarnath.valluri@intel.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Wed, 8 Feb 2017 09:15:33 -0500
X-Google-Sender-Auth: mGMKpqOhtWL_fnUhk7j3-F7bLRw
Message-ID: <CAPuovEJs8vWHca-GW5aMj29PXXyPn3qPAmNpZ7ESRJYxqznmbA@mail.gmail.com>
To: Amarnath Valluri <amarnath.valluri@intel.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 4/4] libvirt: Replace systemd units location to match with bitbake environment.
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
X-List-Received-Date: Wed, 08 Feb 2017 14:15:39 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 8, 2017 at 8:46 AM, Amarnath Valluri
<amarnath.valluri@intel.com> wrote:
> Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
> ---
>  recipes-extended/libvirt/libvirt_1.3.5.bb | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/recipes-extended/libvirt/libvirt_1.3.5.bb b/recipes-extended/libvirt/libvirt_1.3.5.bb
> index c848c99..206f59f 100644
> --- a/recipes-extended/libvirt/libvirt_1.3.5.bb
> +++ b/recipes-extended/libvirt/libvirt_1.3.5.bb
> @@ -213,6 +213,12 @@ PACKAGECONFIG[wireshark] = "--with-wireshark-dissector,--without-wireshark-disse
>  # Enable the Python tool support
>  require libvirt-python.inc
>
> +do_configure_prepend() {
> +       systemd_system_unitdir="${@d.getVar('systemd_system_unitdir')}"
> +       sed -i -e "s;^SYSTEMD_UNIT_DIR =.*;SYSTEMD_UNIT_DIR = $systemd_system_unitdir;" \
> +            ${S}/daemon/Makefile.am ${S}/src/Makefile.am ${S}/tools/Makefile.am

The others patches look fine but for this one is there no way to pass
the value to make? I almost prefer to have this taken care of via a
patch to the source instead of sed expressions here.

Mark

> +}
> +
>  do_install_append() {
>         install -d ${D}/etc/init.d
>         install -d ${D}/etc/libvirt
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

