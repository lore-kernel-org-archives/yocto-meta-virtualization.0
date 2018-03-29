Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ADD6EE00A0C; Thu, 29 Mar 2018 05:08:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.215.65 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AE0F3E0084A
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Mar 2018 05:08:13 -0700 (PDT)
Received: by mail-lf0-f65.google.com with SMTP id p142-v6so8071225lfd.6
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Mar 2018 05:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=jhXJi2AWvakv0TPpcbc8ODB/a+5os2QDdO1FqeFP4Cg=;
	b=B376S7Zwb+Ivys6LdRA07MVKtiq2pPs+/42IEdrnWvIfAqAAZgGLI2wGpkr3z72K7G
	iNeou1+vq9ULTZJiA1uh04AUc7Hp1w5F3iUqFU8UCijipxU0H14ZDmeIz8BOQOWBE9Z4
	bC7XFb6kPcNaAw3Lh1r+19KKOAGhfJjfnvZHpeFpGZvOY/fXrs4rz9AmdXB/cA7S3/dF
	37LsrRxOOyTegCRxPk6eGqIQbV0qO+74Wi/RWmj9W7IKqsAbZR7NAvQn/yJVP0UIfQi/
	5QyI87tyYVBvMJtOMNPn4ap24hWhbufaFsN9Up+Y4kaUL0OyleYyWUXgJujfB4V47FTc
	DNyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=jhXJi2AWvakv0TPpcbc8ODB/a+5os2QDdO1FqeFP4Cg=;
	b=ZH7Utd50o+VpMRxmzVCOZwrzglaCrjlJD1D2sAf50bUGdVp5Ir79RvUY2CuXOcwEcf
	T6fffhFn+P/5BJ6YmAD2NtTGGmOliMD6FM3QTQir8AWscT/RLnLguhCEuKB/x2m4AH7q
	DPtuApogu5ddrlLtR2Tw8pXElOod8kL+3Bp4GLXQPKmCvc0Y2F6RQ3Zl27bT204KIdup
	SxK8P+glXNBhxr0UUEjigJzAUXaOUPfJUfD9xB/lRE+03iFLeNAXYxtClUKQkXwoU/pN
	P6Zqo7YpkgD/NKND0Zodnkdrv97eg+U8neGGhTELtnKpDmB5i1n0Lb7Jgv63OOBANlgs
	EZmg==
X-Gm-Message-State: AElRT7GGp3yltYZJRBIujL/9xofu3BaMKmWtYfPLVu06s3OSsWrIvgjm
	k7Awgf8nD5qMSpGKlUtZEtcv+IycMYGjgyG6ZR/cPVAK
X-Google-Smtp-Source: AIpwx4++MNIyXXAbjEpUwi9xJiqyoLrbuns5K9kTCbsuo+ZgKbzxyb/h5xoXlJWSDiuacUau7uzGyXwYKw+Agz5tQow=
X-Received: by 10.46.134.25 with SMTP id a25mr5173755lji.87.1522325292394;
	Thu, 29 Mar 2018 05:08:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Thu, 29 Mar 2018 05:08:11 -0700 (PDT)
In-Reply-To: <1522100663-5563-1-git-send-email-bhargava.sreekantappa-gayathri@xilinx.com>
References: <1522100663-5563-1-git-send-email-bhargava.sreekantappa-gayathri@xilinx.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 29 Mar 2018 08:08:11 -0400
Message-ID: <CADkTA4MKWNcZdQwacNuXrM+-wfej4YNp4JCUoEY5b=TLw2j_Dg@mail.gmail.com>
To: Bhargava Sreekantappa Gayathri <bhargava.sreekantappa-gayathri@xilinx.com>
Cc: Cyril Chemparathy <cyril.chemparathy@xilinx.com>,
	Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>,
	meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization~][PATCH] inittab: fix hypervisor console
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
X-List-Received-Date: Thu, 29 Mar 2018 12:08:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

When I apply the patch to meta-virt master, I get:

error: patch failed: recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend:1
error: removal patch leaves file contents
error: recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend: patch does not =
apply

While I could just remove the bbappend manually, that error implies
that whatever
you are testing is not the same as the current master branch.

So can you rebase and resend the patch as a v2 ?

Bruce


On Mon, Mar 26, 2018 at 5:44 PM, Bhargava Sreekantappa Gayathri
<bhargava.sreekantappa-gayathri@xilinx.com> wrote:
> From: Cyril Chemparathy <cyril.chemparathy@xilinx.com>
>
> This commit switches over to using existing SERIAL_CONSOLES mechanism
> for hvc0 inittab entry generation.  This then results in
> /bin/start_getty wrapper being used, which avoids the getty failure seen
> when running a xen capable rootfs natively on linux.
>
> Signed-off-by: Cyril Chemparathy <cyril.chemparathy@xilinx.com>
> Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
> Signed-off-by: Bhargava Sreekantappa Gayathri <bhargava.sreekantappa-gaya=
thri@xilinx.com>
> ---
>  conf/distro/include/virt_console.inc                | 1 +
>  conf/layer.conf                                     | 3 +++
>  recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend | 6 ------
>  3 files changed, 4 insertions(+), 6 deletions(-)
>  create mode 100644 conf/distro/include/virt_console.inc
>  delete mode 100644 recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend
>
> diff --git a/conf/distro/include/virt_console.inc b/conf/distro/include/v=
irt_console.inc
> new file mode 100644
> index 0000000..4d56806
> --- /dev/null
> +++ b/conf/distro/include/virt_console.inc
> @@ -0,0 +1 @@
> +SERIAL_CONSOLES_append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'xen=
', ' 115200;hvc0', '', d)}"
> diff --git a/conf/layer.conf b/conf/layer.conf
> index f71c117..461c73a 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -20,6 +20,9 @@ LAYERDEPENDS_virtualization-layer =3D "core networking-=
layer"
>  # Override security flags
>  require conf/distro/include/virt_security_flags.inc
>
> +# Add hypervisor console
> +require conf/distro/include/virt_console.inc
> +
>  PREFERRED_PROVIDER_virtual/runc ?=3D "runc-docker"
>  PREFERRED_PROVIDER_virtual/containerd ?=3D "containerd-docker"
>
> diff --git a/recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend b/recipe=
s-core/sysvinit/sysvinit-inittab_2.%.bbappend
> deleted file mode 100644
> index 1b89aec..0000000
> --- a/recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -do_install_append() {
> -       if echo "${DISTRO_FEATURES}" | grep -q 'xen'; then
> -               echo "" >> ${D}${sysconfdir}/inittab
> -               echo "X0:12345:respawn:/sbin/getty 115200 hvc0" >> ${D}${=
sysconfdir}/inittab
> -       fi
> -}
> --
> 2.7.4
>
> This email and any attachments are intended for the sole use of the named=
 recipient(s) and contain(s) confidential information that may be proprieta=
ry, privileged or copyrighted under applicable law. If you are not the inte=
nded recipient, do not read, copy, or forward this email message or any att=
achments. Delete this email message and any attachments immediately.
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

