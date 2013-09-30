Return-Path: <asselsm@gmail.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 94AA9E0167A
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Sep 2013 06:24:03 -0700 (PDT)
Received: by mail-ie0-f170.google.com with SMTP id x13so10444249ief.29
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Sep 2013 06:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=tNn5d8eUis0FbuGe3fh6Tbc1B2JZplz7wmKugIcmE90=;
	b=cwJ2A+GI3rlLqbXaEdjwwPX75E8Wzv2pU1z6H8wlYJn8Y9xJydoa8XSHnfpGW+9Wme
	xJGd2z6hYRxxc+4MaDu8mJAQKSlUzOjnzI07JGCBQvEw1Pxcd7e5gKCmmtcWZoSC9b3G
	S1gkrIDgQ4eBDpBxwk6dwRrng8zwkEsF4gvcS5rW+NhoAwCPJbcB6yKGjsIHvFxCxEdW
	bZOscoEFv/HvMcIkwDgnvXcv36IWuuXSogSULMkF6zy9IXeH2hvLYp/CopuOGtQRmSCV
	N+IAandSSPfwZYmZIWWJVCBwyohp16caMBwrVtqujW+NBPxx9oziFWtXwp33cyl0sYbq
	T+Xg==
MIME-Version: 1.0
X-Received: by 10.50.77.72 with SMTP id q8mr13891047igw.14.1380547443038; Mon,
	30 Sep 2013 06:24:03 -0700 (PDT)
Sender: asselsm@gmail.com
Received: by 10.43.150.9 with HTTP; Mon, 30 Sep 2013 06:24:02 -0700 (PDT)
In-Reply-To: <1380537602-28880-1-git-send-email-bogdan.purcareata@freescale.com>
References: <1380537602-28880-1-git-send-email-bogdan.purcareata@freescale.com>
Date: Mon, 30 Sep 2013 09:24:02 -0400
X-Google-Sender-Auth: 6c782IA3GXD5xupAdATylPOAu0I
Message-ID: <CAPuovEJkvD5ighvKZzwXWovKdUn+byMnOweZ-BjV2c10C_p=Kw@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Bogdan Purcareata <bogdan.purcareata@freescale.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] libvirt: Don't fail when mounting securityfs with containers
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
X-List-Received-Date: Mon, 30 Sep 2013 13:24:07 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 30, 2013 at 6:40 AM, Bogdan Purcareata
<bogdan.purcareata@freescale.com> wrote:
> When starting containers under libvirt, the code will automatically
> try to mount securityfs in the new mount namespace. Since securityfs
> support is not available on all embedded platforms, add runtime check
> of its presence in the current running kernel. Based on this, mount
> securityfs in libvirt containers.
>
> Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> ---
>  .../Don-t-fail-when-mounting-securityfs.patch      | 101 +++++++++++++++++++++
>  recipes-extended/libvirt/libvirt_1.1.2.bb          |   3 +-
>  2 files changed, 103 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-extended/libvirt/libvirt/Don-t-fail-when-mounting-securityfs.patch

Bogdan,

I was actually preparing a similar commit but using a slightly
different strategy. There are three upstream libvirt commits related
to this that I had applied (I just hadn't tested it yet so hadn't sent
this out for review).

1583dfda7c4e5ad71efe0615c06e5676528d8203
[LXC: Don't mount securityfs when user namespace enabled]

f27f5f7eddf531159d791a2b5ac438ca011b5f26
[Move array of mounts out of lxcContainerMountBasicFS]

1c7037cff42dde35913dde533b31ee1da8c2d6e0
[LXC: don't try to mount selinux filesystem when user namespace enabled]

These will apply cleanly in this order. I figured if we did this for
securityfs we might as well also do the same for selinux. The middle
commit just provides context to allow the 3rd patch to apply cleanly.
How do you suppose we move ahead?

Mark



>
> diff --git a/recipes-extended/libvirt/libvirt/Don-t-fail-when-mounting-securityfs.patch b/recipes-extended/libvirt/libvirt/Don-t-fail-when-mounting-securityfs.patch
> new file mode 100644
> index 0000000..865dcb5
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/Don-t-fail-when-mounting-securityfs.patch
> @@ -0,0 +1,101 @@
> +From 258c44b56fca2b4095fc1cf76e2a3baf0ce3f33f Mon Sep 17 00:00:00 2001
> +From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> +Date: Wed, 25 Sep 2013 13:19:47 +0300
> +Subject: [PATCH] Don't fail when mounting securityfs when it's not supported
> +
> +Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> +---
> + src/lxc/lxc_container.c | 59 +++++++++++++++++++++++++++++++++++++++++++++++++
> + 1 file changed, 59 insertions(+)
> +
> +diff --git a/src/lxc/lxc_container.c b/src/lxc/lxc_container.c
> +index 8abaea0..a44c9ef 100644
> +--- a/src/lxc/lxc_container.c
> ++++ b/src/lxc/lxc_container.c
> +@@ -509,6 +509,59 @@ static int lxcContainerChildMountSort(const void *a, const void *b)
> + # define MS_SLAVE                (1<<19)
> + #endif
> +
> ++/*
> ++ * This function attempts to detect kernel support
> ++ * for a specific filesystem type. This is done by
> ++ * inspecting /proc/filesystems.
> ++ */
> ++static int lxcCheckFSSupport(const char *fs_type)
> ++{
> ++    FILE *fp = NULL;
> ++    int ret = -1;
> ++    const char *fslist = "/proc/filesystems";
> ++    char *line = NULL;
> ++    const char *type;
> ++
> ++    if(!fs_type)
> ++          return 1;
> ++
> ++    VIR_DEBUG("Checking kernel support for %s", fs_type);
> ++
> ++    VIR_DEBUG("Open  %s", fslist);
> ++    if (!(fp = fopen(fslist, "r"))) {
> ++        if (errno == ENOENT)
> ++
> ++        virReportSystemError(errno,
> ++                             _("Unable to read %s"),
> ++                             fslist);
> ++        goto cleanup;
> ++    }
> ++
> ++    while (!feof(fp)) {
> ++        size_t n;
> ++        VIR_FREE(line);
> ++        if (getline(&line, &n, fp) <= 0) {
> ++            if (feof(fp))
> ++                break;
> ++
> ++            goto cleanup;
> ++        }
> ++
> ++        type = strstr(line, fs_type);
> ++        if (type) {
> ++            ret = 1;
> ++          goto cleanup;
> ++      }
> ++    }
> ++
> ++    ret = 0;
> ++
> ++cleanup:
> ++    VIR_FREE(line);
> ++    VIR_FORCE_FCLOSE(fp);
> ++    return ret;
> ++}
> ++
> + static int lxcContainerGetSubtree(const char *prefix,
> +                                   char ***mountsret,
> +                                   size_t *nmountsret)
> +@@ -784,17 +837,23 @@ static int lxcContainerMountBasicFS(void)
> +
> +     for (i = 0; i < ARRAY_CARDINALITY(mnts); i++) {
> +         const char *srcpath = NULL;
> ++      const char *dstpath = NULL;
> +
> +         VIR_DEBUG("Processing %s -> %s",
> +                   mnts[i].src, mnts[i].dst);
> +
> +         srcpath = mnts[i].src;
> ++      dstpath = mnts[i].dst;
> +
> +         /* Skip if mount doesn't exist in source */
> +         if ((srcpath[0] == '/') &&
> +             (access(srcpath, R_OK) < 0))
> +             continue;
> +
> ++      if ((access(dstpath, R_OK) < 0) || /* mount is not present on host */
> ++          (!lxcCheckFSSupport(mnts[i].type))) /* no fs support in kernel */
> ++              continue;
> ++
> + #if WITH_SELINUX
> +         if (STREQ(mnts[i].src, SELINUX_MOUNT) &&
> +             !is_selinux_enabled())
> +--
> +1.7.11.7
> +
> diff --git a/recipes-extended/libvirt/libvirt_1.1.2.bb b/recipes-extended/libvirt/libvirt_1.1.2.bb
> index cfb406d..240f3d2 100644
> --- a/recipes-extended/libvirt/libvirt_1.1.2.bb
> +++ b/recipes-extended/libvirt/libvirt_1.1.2.bb
> @@ -25,7 +25,8 @@ RCONFLICTS_${PN}_libvirtd = "connman"
>  SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz \
>             file://tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch \
>            file://libvirtd.sh \
> -          file://libvirtd.conf"
> +          file://libvirtd.conf \
> +          file://Don-t-fail-when-mounting-securityfs.patch"
>
>  SRC_URI[md5sum] = "1835bbfa492099bce12e2934870e5611"
>  SRC_URI[sha256sum] = "16648af54d3e162f5cc5445d970ec29a0bd55b1dbcb568a05533c4c2f25965e3"
> --
> 1.7.11.7
>
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

