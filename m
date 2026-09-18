Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3234CC88E75
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 03:21:55 +0000 (UTC)
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3476.1789701714580376961
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 17 Sep 2026 20:21:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=X0u+vbV/;
 spf=pass (domain: gmail.com, ip: 74.125.227.140, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747eb79f6so1664345ad.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 17 Sep 2026 20:21:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789701714; cv=none;
        d=google.com; s=arc-20260327;
        b=jdZQkQfIo7iFBSJhJ0P1QQQPxDItMUnBs/ipPC3/88rxrIrYtrlx4U6axs1k55oY0Z
         XY+guSfpP7ipZ5RfPLy0vnhr7/DipQDv+PNJ8i/4712D1HJGQpy02Iihcbrikb35WTmQ
         rVefu40L7CQLsEt1NnGEKaOswzNauaKagZvG+3tqSZHKgzcrwmXZKZA+wQdUlOp7kfuR
         gkzaiFBmPImzuUOIy9n/T7j+JpKwoVliT14BuwuAs4ZFXH7UW8MOHGJEm9fj4sgisV1q
         Ppm6M0Rxb44LKMIbsPAKQUJbY3xLQ0pCbe1wwIhFbKnM5EQ34mmF1qce05qjyNae5T8F
         7J2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rYn8i9t/lPm+f8n1hoaSJrg4oSE0bchmBkSkzkAJtmw=;
        fh=5ca/oK0Ev0r59b4fexPfFWzfdKxQt7oAvkkIofarbiI=;
        b=lk4Joon2co8C5tpXDnFid+JRd9Jydu2ROHdFJNkf8OEiu0uBReP1U1Tiu3gX8Xs5jN
         cVMYT/+NSacXHZnOMJ4uF9vaoeZ1MKzmbWa+4m7LQWgBM1xGNEGDAbqzYdeOJHGv+8xt
         kSXD/yN0oYNNWrpu37DjyJof20VrBEAq4ErRbLSX5ISeKGEkfgGX/KwUjbA9CCvPLare
         3qQKzKC/+5s62DjYhsFvqB70n6JU3q1+mg5rUf+ylyybc51L1Y/w+RpqK199PRtwKc3A
         i/hwiqevlAXL3dGRcS75Rb+BFsXtYU5B3Jv44hM1AQRyRhGppCjqdFbsFCp/fY30fc9+
         zA6g==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789701714; x=1790306514; darn=lists.yoctoproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rYn8i9t/lPm+f8n1hoaSJrg4oSE0bchmBkSkzkAJtmw=;
        b=X0u+vbV/Cer2KNz0gIc/yU9in0r8T12q7rKXcQyNBUI769ledoRqeYH1EhW5tW/B6O
         LRxvU7/fmkYZWHt95ep5hZqdlElAaTmf4kUP157bpKlIr1SoJwb0UkkjbbW4N6JcwMUv
         zYbMusFOEThNIMH80PhyVTpe6wDRo/emdUlOzuVeVcN8IbbkZR57gM2t2TuNtqrbMyrd
         WQmR5DOp6BZd4q5IciNZs3C5ltNMtX2FxYQQOzom9Yq8Kx3DNXZWfj0rtkr75I2mvlhU
         lT+aJttNm4oEg0EI99REZGIc05wLiqho81lDyvopgyLg3Q+afEKV4HkF5rkvS2gHPk1M
         C0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789701714; x=1790306514;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rYn8i9t/lPm+f8n1hoaSJrg4oSE0bchmBkSkzkAJtmw=;
        b=2uASmyYhgPM97VLzitMNrXAP+YBxHCDYG6NQ2b2XsvH/1+UEiw+uxnZGQAXauy/Ftn
         RnpAf3JmaeoOQhVVZ9uINc8FyiGxQ4APZOSKAgJTLULCNm3wn3oA40SEvjsV7yc0ApO3
         JaJ8vlOJxC5Shb6mkdvQM3wi08wrR5DMMRkIOvBIB1jzxBMulOu4cHs2SD7TJPi7tIel
         VN04vcYnDwnZ86VjZKhuCKHVy5SOkPKR4A7+jV0FjSvFzVGoLKCqM57XIcSVki4HymzO
         b2XAE6mQdLDWsxOGuyynCcdljQVk5rkj3dsqyaUI+k+89PvPHuQPyyVd384i2Lfz6awe
         dgkQ==
X-Gm-Message-State: AFuF++kAsNcGDIRfVHyX7AiBl4eWci226EVyp81nixX/IxPxhn0FpyJQ
	g0Cr9+bDM21DBotNfAR1kp9DWz5+2GeLinSwK2fI2XyJ1BtdxnQDukTyuLnqlDs5AJhPoEZmzAB
	0HRkzeK/083AwOXaka3O9qol0dDF3bgU=
X-Gm-Gg: AYBFou2DghCpwugJRU6l12n7IshjrBThRF9Md5oP50IuC1FcxIDKk6ueq9KJ1oQr/sJ
	xL0MnBcBtQKXGrwa4Wjh5jkXRghQHp426z1An/ePFzbfq2LmFuA4pOJvLSEnkobjvaeJ5afxvtX
	b0aU+YiZKvWifDP2I9mHf5T9L6fLg/+Y0zy34afkT3VzxIH2024zp3oqId0NrgZ38dG2X0SJVgY
	UGx/LvCMWb4LjV4lGUfifaIDoLXnWHFesPqeVXQ5RevnTj0gmJCSS7KGm+knrYudlTe8XBAEf+b
	TAtU0yPOwuE+akfaodAUDlokFnFeR8+b/ENUx/TCZ7tOwYLztALUD945vvWHQTBRHWlzmKLGUkC
	AAimNlnp9XAVuuhbizfpexQVwH/EfDOdhezTqAutJh2FIrXHD/MZKMu3u8WnBt3nLQgws3BKMHw
	==
X-Received: by 2002:a17:903:2443:b0:2dd:792b:302 with SMTP id
 d9443c01a7336-2ddb1af0da2mr19506685ad.11.1789701713616; Thu, 17 Sep 2026
 20:21:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260918024923.1866168-1-sandeep.gundlupet-raju@amd.com>
In-Reply-To: <20260918024923.1866168-1-sandeep.gundlupet-raju@amd.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 17 Sep 2026 23:21:42 -0400
X-Gm-Features: AcwNN1VkVimeaAbTvHwawfEpY-_cHNqFLfiy7nntzRTDb6NW8ZIr7z1px1F4zDE
Message-ID: <CADkTA4PFX5HDZZozVKY6XJg8HmuG8p4gkUQnR6JAAXnyqKLbfA@mail.gmail.com>
Subject: Re: [meta-virtualization][master][wrynose][PATCH 1/1] xilinx: Remove
 redundant device-tree/u-boot recipes
To: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000e4e3c5065bb966c5"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 18 Sep 2026 03:21:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10086

--000000000000e4e3c5065bb966c5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 10:49=E2=80=AFPM Sandeep Gundlupet Raju <
sandeep.gundlupet-raju@amd.com> wrote:

> Remove dynamic-layers/xilinx/recipes-bsp/device-tree and
> dynamic-layers/xilinx/recipes-bsp/u-boot, both now redundant:
>
> - device-tree.bbappend + files/*.dtsi (Xen DT overlay includes for
>   zynqmp/versal/versal-net) are duplicated, with additional
>   versal-2vp and TARGET_OS-guard support, by
>   meta-xilinx/meta-xilinx-virtualization/recipes-bsp/device-tree.
>
> - u-boot-xlnx-scr.bbappend + xen-boot-cmd.inc + boot.cmd.xen provided
>   an ENABLE_XEN_UBOOT_SCR-gated Xen boot.scr flow bolted onto
>   u-boot-xlnx-scr. The standalone u-boot-xen-scr recipe in
>   meta-xilinx/meta-xilinx-virtualization (selected via
>   UBOOT_BOOT_SCRIPT:append =3D " u-boot-xen-scr", see
>   meta-xilinx-virtualization/README.xen.boot.scr.md) is the
>   supported replacement, generating xen_boot.scr via the Xen
>   image-builder dom0/dom0less template configs instead.
>

Except that we don't have a layer dependency on the xilinx layers in
meta-virtualization. Those were supposed to be captured upstream
references (I'm not saying they are, but that was the intent).

So I'd rather not delete them, then have a dependency on some
sort of nested virtualization layer within the xilinx layer, I fail to see
how that makes anything easier to use.

Bruce



>
> Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
> ---
>  .../device-tree/device-tree.bbappend          |  19 ---
>  .../files/versal-net-xen-qemu.dtsi            |   2 -
>  .../device-tree/files/versal-net-xen.dtsi     |  67 ----------
>  .../device-tree/files/versal-xen-qemu.dtsi    |   2 -
>  .../device-tree/files/versal-xen.dtsi         |  59 ---------
>  .../device-tree/files/zynqmp-xen-qemu.dtsi    |   2 -
>  .../device-tree/files/zynqmp-xen.dtsi         | 123 ------------------
>  .../u-boot/u-boot-xlnx-scr.bbappend           |   4 -
>  .../u-boot/u-boot-xlnx-scr/boot.cmd.xen       |  80 ------------
>  .../recipes-bsp/u-boot/xen-boot-cmd.inc       |  38 ------
>  10 files changed, 396 deletions(-)
>  delete mode 100644
> dynamic-layers/xilinx/recipes-bsp/device-tree/device-tree.bbappend
>  delete mode 100644
> dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-net-xen-qemu.d=
tsi
>  delete mode 100644
> dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-net-xen.dtsi
>  delete mode 100644
> dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-xen-qemu.dtsi
>  delete mode 100644
> dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-xen.dtsi
>  delete mode 100644
> dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen-qemu.dtsi
>  delete mode 100644
> dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen.dtsi
>  delete mode 100644
> dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
>  delete mode 100644
> dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr/boot.cmd.xen
>  delete mode 100644
> dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
>
> diff --git
> a/dynamic-layers/xilinx/recipes-bsp/device-tree/device-tree.bbappend
> b/dynamic-layers/xilinx/recipes-bsp/device-tree/device-tree.bbappend
> deleted file mode 100644
> index 813c08f8..00000000
> --- a/dynamic-layers/xilinx/recipes-bsp/device-tree/device-tree.bbappend
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
> -
> -ENABLE_XEN_DTSI ?=3D ""
> -ENABLE_XEN_QEMU_DTSI ?=3D ""
> -
> -XEN_EXTRA_DT_INCLUDE_FILES =3D ""
> -XEN_EXTRA_QEMU_DT_INCLUDE_FILES =3D ""
> -
> -XEN_EXTRA_DT_INCLUDE_FILES:zynqmp =3D "zynqmp-xen.dtsi"
> -XEN_EXTRA_QEMU_DT_INCLUDE_FILES:zynqmp =3D "zynqmp-xen.dtsi
> zynqmp-xen-qemu.dtsi"
> -
> -XEN_EXTRA_DT_INCLUDE_FILES:versal =3D "versal-xen.dtsi"
> -XEN_EXTRA_QEMU_DT_INCLUDE_FILES:versal =3D "versal-xen.dtsi
> versal-xen-qemu.dtsi"
> -
> -XEN_EXTRA_DT_INCLUDE_FILES:versal-net =3D "versal-net-xen.dtsi"
> -XEN_EXTRA_QEMU_DT_INCLUDE_FILES:versal-net =3D "versal-net-xen.dtsi
> versal-net-xen-qemu.dtsi"
> -
> -EXTRA_DT_INCLUDE_FILES:append =3D "${@' ${XEN_EXTRA_DT_INCLUDE_FILES}' i=
f
> d.getVar('ENABLE_XEN_DTSI') =3D=3D '1' else ''}"
> -EXTRA_DT_INCLUDE_FILES:append =3D "${@' ${XEN_EXTRA_QEMU_DT_INCLUDE_FILE=
S}'
> if d.getVar('ENABLE_XEN_QEMU_DTSI') =3D=3D '1' else ''}"
> diff --git
> a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-net-xen-qemu=
.dtsi
> b/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-net-xen-qemu=
.dtsi
> deleted file mode 100644
> index 336d7a25..00000000
> ---
> a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-net-xen-qemu=
.dtsi
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -/ {
> -};
> diff --git
> a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-net-xen.dtsi
> b/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-net-xen.dtsi
> deleted file mode 100644
> index 7da1f9f1..00000000
> ---
> a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-net-xen.dtsi
> +++ /dev/null
> @@ -1,67 +0,0 @@
> -&smmu {
> -    status =3D "okay";
> -};
> -
> -&adma0 {
> -    iommus =3D <&smmu 0x210>;
> -};
> -
> -&adma1 {
> -    iommus =3D <&smmu 0x212>;
> -};
> -
> -&adma2 {
> -    iommus =3D <&smmu 0x214>;
> -};
> -
> -&adma3 {
> -    iommus =3D <&smmu 0x216>;
> -};
> -
> -&adma4 {
> -    iommus =3D <&smmu 0x218>;
> -};
> -
> -&adma5 {
> -    iommus =3D <&smmu 0x21a>;
> -};
> -
> -&adma6 {
> -    iommus =3D <&smmu 0x21c>;
> -};
> -
> -&adma7 {
> -    iommus =3D <&smmu 0x21e>;
> -};
> -
> -&dwc3_0 {
> -    iommus =3D <&smmu 0x230>;
> -};
> -
> -&dwc3_1 {
> -    iommus =3D <&smmu 0x232>;
> -};
> -
> -&gem0 {
> -    iommus =3D <&smmu 0x234>;
> -};
> -
> -&gem1 {
> -    iommus =3D <&smmu 0x235>;
> -};
> -
> -&sdhci0 {
> -    iommus =3D <&smmu 0x242>;
> -};
> -
> -&sdhci1 {
> -    iommus =3D <&smmu 0x243>;
> -};
> -
> -&qspi {
> -    iommus =3D <&smmu 0x244>;
> -};
> -
> -&ospi {
> -    iommus =3D <&smmu 0x245>;
> -};
> diff --git
> a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-xen-qemu.dts=
i
> b/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-xen-qemu.dts=
i
> deleted file mode 100644
> index 336d7a25..00000000
> ---
> a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-xen-qemu.dts=
i
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -/ {
> -};
> diff --git
> a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-xen.dtsi
> b/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-xen.dtsi
> deleted file mode 100644
> index 6782e925..00000000
> --- a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-xen.dtsi
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -&smmu {
> -       status =3D "okay";
> -};
> -
> -&gem0 {
> -    iommus =3D <&smmu 0x234>;
> -};
> -
> -&gem1 {
> -    iommus =3D <&smmu 0x235>;
> -};
> -
> -&dwc3_0 {
> -    iommus =3D <&smmu 0x230>;
> -};
> -
> -&qspi {
> -    iommus =3D <&smmu 0x244>;
> -};
> -
> -&lpd_dma_chan0 {
> -    iommus =3D <&smmu 0x210>;
> -};
> -
> -&lpd_dma_chan1 {
> -    iommus =3D <&smmu 0x212>;
> -};
> -
> -&lpd_dma_chan2 {
> -    iommus =3D <&smmu 0x214>;
> -};
> -
> -&lpd_dma_chan3 {
> -    iommus =3D <&smmu 0x216>;
> -};
> -
> -&lpd_dma_chan4 {
> -    iommus =3D <&smmu 0x218>;
> -};
> -
> -&lpd_dma_chan5 {
> -    iommus =3D <&smmu 0x21a>;
> -};
> -
> -&lpd_dma_chan6 {
> -    iommus =3D <&smmu 0x21c>;
> -};
> -
> -&lpd_dma_chan7 {
> -    iommus =3D <&smmu 0x21e>;
> -};
> -
> -&sdhci0 {
> -    iommus =3D <&smmu 0x242>;
> -};
> -
> -&sdhci1 {
> -    iommus =3D <&smmu 0x243>;
> -};
> diff --git
> a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen-qemu.dts=
i
> b/dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen-qemu.dts=
i
> deleted file mode 100644
> index 336d7a25..00000000
> ---
> a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen-qemu.dts=
i
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -/ {
> -};
> diff --git
> a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen.dtsi
> b/dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen.dtsi
> deleted file mode 100644
> index 3d75be65..00000000
> --- a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen.dtsi
> +++ /dev/null
> @@ -1,123 +0,0 @@
> -&smmu {
> -       status =3D "okay";
> -};
> -
> -&gem0 {
> -    iommus =3D <&smmu 0x874>;
> -};
> -
> -&gem1 {
> -    iommus =3D <&smmu 0x875>;
> -};
> -
> -&gem2 {
> -    iommus =3D <&smmu 0x876>;
> -};
> -
> -&gem3 {
> -    iommus =3D <&smmu 0x877>;
> -};
> -
> -&dwc3_0 {
> -    iommus =3D <&smmu 0x860>;
> -};
> -
> -&dwc3_1 {
> -    iommus =3D <&smmu 0x861>;
> -};
> -
> -&qspi {
> -    iommus =3D <&smmu 0x873>;
> -};
> -
> -&lpd_dma_chan1 {
> -    iommus =3D <&smmu 0x868>;
> -};
> -
> -&lpd_dma_chan2 {
> -    iommus =3D <&smmu 0x869>;
> -};
> -
> -&lpd_dma_chan3 {
> -    iommus =3D <&smmu 0x86a>;
> -};
> -
> -&lpd_dma_chan4 {
> -    iommus =3D <&smmu 0x86b>;
> -};
> -
> -&lpd_dma_chan5 {
> -    iommus =3D <&smmu 0x86c>;
> -};
> -
> -&lpd_dma_chan6 {
> -    iommus =3D <&smmu 0x86d>;
> -};
> -
> -&lpd_dma_chan7 {
> -    iommus =3D <&smmu 0x86e>;
> -};
> -
> -&lpd_dma_chan8 {
> -    iommus =3D <&smmu 0x86f>;
> -};
> -
> -&fpd_dma_chan1 {
> -    iommus =3D <&smmu 0x14e8>;
> -};
> -
> -&fpd_dma_chan2 {
> -    iommus =3D <&smmu 0x14e9>;
> -};
> -
> -&fpd_dma_chan3 {
> -    iommus =3D <&smmu 0x14ea>;
> -};
> -
> -&fpd_dma_chan4 {
> -    iommus =3D <&smmu 0x14eb>;
> -};
> -
> -&fpd_dma_chan5 {
> -    iommus =3D <&smmu 0x14ec>;
> -};
> -
> -&fpd_dma_chan6 {
> -    iommus =3D <&smmu 0x14ed>;
> -};
> -
> -&fpd_dma_chan7 {
> -    iommus =3D <&smmu 0x14ee>;
> -};
> -
> -&fpd_dma_chan8 {
> -    iommus =3D <&smmu 0x14ef>;
> -};
> -
> -&sdhci0 {
> -    iommus =3D <&smmu 0x870>;
> -};
> -
> -&sdhci1 {
> -    iommus =3D <&smmu 0x871>;
> -};
> -
> -&nand0 {
> -    iommus =3D <&smmu 0x872>;
> -};
> -
> -&pcie {
> -    iommus =3D <&smmu 0x4d0>;
> -};
> -
> -&zynqmp_dpsub {
> -    iommus =3D <&smmu 0xce3>;
> -};
> -
> -&zynqmp_dpdma {
> -    iommus =3D <&smmu 0xce4>;
> -};
> -
> -&sata {
> -    iommus =3D <&smmu 0x4c0>, <&smmu 0x4c1>, <&smmu 0x4c2>, <&smmu 0x4c3=
>;
> -};
> diff --git
> a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
> b/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
> deleted file mode 100644
> index ec64d246..00000000
> --- a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -# Include xen-boot-cmd.inc only if ENABLE_XEN_UBOOT_SCR is set from
> configuration
> -# file and xen enabled in DISTRO_FEATURES.
> -ENABLE_XEN_UBOOT_SCR ?=3D ""
> -include ${@'xen-boot-cmd.inc' if d.getVar('ENABLE_XEN_UBOOT_SCR') =3D=3D=
 '1'
> and bb.utils.contains('DISTRO_FEATURES', 'xen', True, False, d) else ''}
> diff --git
> a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr/boot.cmd.xen
> b/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr/boot.cmd.xen
> deleted file mode 100644
> index 25e5842c..00000000
> --- a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr/boot.cmd.x=
en
> +++ /dev/null
> @@ -1,80 +0,0 @@
> -# This is a boot script for U-Boot with Xen parameters used by yocto
> machine
> -# configuration file.
> -# Generate boot.scr:
> -# mkimage -c none -A arm -T script -d boot.cmd.xen boot.scr
> -#
> -################
> -xen_name=3D@@XEN_IMAGE_NAME@@
> -kernel_name=3D@@KERNEL_IMAGE@@
> -rootfs_name=3D@@RAMDISK_IMAGE@@
> -@@PRE_BOOTENV@@
> -
> -for boot_target in ${boot_targets};
> -do
> -       echo "Trying to load boot images from ${boot_target}"
> -       if test "${boot_target}" =3D "jtag" ; then
> -               tftpboot @@KERNEL_LOAD_ADDRESS@@ ${kernel_name}
> -               setenv kernel_size 0x$filesize;
> -               tftpboot @@RAMDISK_IMAGE_ADDRESS@@ ${rootfs_name}
> -               setenv ramdisk_size 0x$filesize;
> -               tftpboot @@XEN_LOAD_ADDRESS@@ ${xen_name}
> -               tftpboot @@DEVICETREE_ADDRESS@@ system.dtb
> -       fi
> -       if test "${boot_target}" =3D "mmc0" || test "${boot_target}" =3D
> "mmc1" || test "${boot_target}" =3D "usb0" || test "${boot_target}" =3D "=
usb1";
> then
> -               if test "${boot_target}" =3D "mmc0" || test "${boot_targe=
t}"
> =3D "mmc1"; then
> -                       setenv bootdev mmcblk${devnum}p
> -               fi
> -               if test "${boot_target}" =3D "usb0" || test "${boot_targe=
t}"
> =3D "usb1"; then
> -                       setenv bootdev sda
> -               fi
> -               echo "Checking for /${xen_name}"
> -               if test -e ${devtype} ${devnum}:${distro_bootpart}
> /${xen_name}; then
> -                       echo "Loading ${xen_name}";
> -                       fatload ${devtype} ${devnum}:${distro_bootpart}
> @@XEN_LOAD_ADDRESS@@ ${xen_name};
> -               fi
> -               echo "Checking for /${kernel_name}"
> -               if test -e ${devtype} ${devnum}:${distro_bootpart}
> /${kernel_name}; then
> -                       echo "Loading ${kernel_name}";
> -                       fatload ${devtype} ${devnum}:${distro_bootpart}
> @@KERNEL_LOAD_ADDRESS@@ ${kernel_name};
> -                       setenv kernel_size 0x$filesize;
> -               fi
> -               echo "Checking for /system.dtb"
> -               if test -e ${devtype} ${devnum}:${distro_bootpart}
> /system.dtb; then
> -                       echo "Loading system.dtb";
> -                       fatload ${devtype} ${devnum}:${distro_bootpart}
> @@DEVICETREE_ADDRESS@@ system.dtb;
> -               fi
> -               echo "Checking for /${rootfs_name}"
> -               if test -e ${devtype} ${devnum}:${distro_bootpart}
> /${rootfs_name} && test "${skip_ramdisk}" !=3D "yes"; then
> -                       echo "Loading ${rootfs_name}";
> -                       fatload ${devtype} ${devnum}:${distro_bootpart}
> @@RAMDISK_IMAGE_ADDRESS@@ ${rootfs_name};
> -                       setenv ramdisk_size 0x$filesize;
> -               fi
> -       fi
> -       fdt addr @@DEVICETREE_ADDRESS@@
> -       fdt resize 0x1000
> -       fdt get value bootargs /chosen bootargs
> -       fdt set /chosen \#address-cells <0x2>
> -       fdt set /chosen \#size-cells <0x2>
> -       setenv xen_bootargs "console=3Ddtuart dtuart=3D@@XEN_SERIAL_CONSO=
LES@@
> dom0_mem=3D@@DOM0_MEM@@ dom0_max_vcpus=3D@@DOM0_MAX_VCPUS@@ bootscrub=3D0
> vwfi=3Dnative @@XEN_CMDLINE_APPEND@@"
> -       fdt set /chosen xen,xen-bootargs \"${xen_bootargs}\"
> -
> -       # Check that env $ramdisk_size is 0 or not.
> -       if test -n ${ramdisk_size}; then
> -               fdt mknod /chosen dom0-ramdisk
> -               fdt set /chosen/dom0-ramdisk compatible
> "xen,linux-initrd" "xen,multiboot-module" "multiboot,module"
> -               fdt set /chosen/dom0-ramdisk reg <0x0
> @@RAMDISK_IMAGE_ADDRESS@@ 0x0 ${ramdisk_size}>
> -               setenv rootfs_param @@KERNEL_ROOT_RAMDISK@@
> -       else
> -               setenv rootfs_param @@KERNEL_ROOT_SD@@
> -       fi
> -
> -       fdt mknod /chosen dom0
> -       fdt set /chosen/dom0 compatible  "xen,linux-zimage"
> "xen,multiboot-module" "multiboot,module"
> -       fdt set /chosen/dom0 reg <0x0 @@KERNEL_LOAD_ADDRESS@@ 0x0
> ${kernel_size}>
> -       setenv dom0_bootargs "console=3Dhvc0 earlycon=3Dxen earlyprintk=
=3Dxen
> clk_ignore_unused ${rootfs_param}"
> -       fdt set /chosen xen,dom0-bootargs \"${dom0_bootargs}\"
> -
> -       setenv fdt_high 0xffffffffffffffff
> -
> -       @@KERNEL_BOOTCMD@@ @@XEN_LOAD_ADDRESS@@ - @@DEVICETREE_ADDRESS@@
> -done
> diff --git a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
> b/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
> deleted file mode 100644
> index 7a4e41a6..00000000
> --- a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -FILESEXTRAPATHS:append :=3D ":${THISDIR}/u-boot-xlnx-scr"
> -
> -SRC_URI +=3D "file://boot.cmd.xen"
> -
> -# Image offsets for Xen boot
> -KERNEL_OFFSET:zynqmp ?=3D "0xE00000"
> -KERNEL_OFFSET:versal ?=3D "0xE00000"
> -
> -DEVICETREE_OFFSET:zynqmp ?=3D "0xC000000"
> -DEVICETREE_OFFSET:versal ?=3D "0xC000000"
> -
> -RAMDISK_OFFSET:zynqmp ?=3D "0x2600000"
> -RAMDISK_OFFSET:versal ?=3D "0x2600000"
> -
> -XEN_OFFSET:zynqmp ?=3D "0xBA00000"
> -XEN_OFFSET:versal ?=3D "0xBA00000"
> -XEN_LOAD_ADDRESS ?=3D "${@append_baseaddr(d,d.getVar('XEN_OFFSET'))}"
> -
> -# If dom0-ramdisk is used for Xen boot then set RAMDISK image to cpio.gz
> -XEN_IMAGE_NAME ?=3D "xen"
> -RAMDISK_IMAGE ?=3D "rootfs.cpio.gz"
> -
> -# Set the amount of memory for dom0 depending on total available memory
> size(DDR).
> -DOM0_MEM ?=3D "1500M"
> -
> -# Specify which UART console Xen should use. You can sepecify the
> devicetree
> -# alias or full path to a node in the devicetree
> -# XEN_SERIAL_CONSOLES ?=3D "serial0" or XEN_SERIAL_CONSOLES ?=3D
> "/axi/serial@ff000000"
> -XEN_SERIAL_CONSOLES ?=3D "serial0"
> -
> -# Specify additional Xen paramaters which will be appended to xen-bootar=
gs
> -# This can alos be used for debugging purposes.
> -# Examples: XEN_CMDLINE_APPEND ?=3D "sched=3Dcredit loglvl=3Dall
> guest_loglvl=3Ddebug"
> -XEN_CMDLINE_APPEND ?=3D ""
> -
> -# Specify the max number of vcpus for dom0
> -# Example usage: DOM0_MAX_VCPUS =3D "2" or DOM0_MAX_VCPUS =3D "2-4"
> -DOM0_MAX_VCPUS ?=3D "1"
> --
> 2.34.1
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000e4e3c5065bb966c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 17, 2026 at 10:49=
=E2=80=AFPM Sandeep Gundlupet Raju &lt;<a href=3D"mailto:sandeep.gundlupet-=
raju@amd.com">sandeep.gundlupet-raju@amd.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Remove dynamic-layers/xilinx/re=
cipes-bsp/device-tree and<br>
dynamic-layers/xilinx/recipes-bsp/u-boot, both now redundant:<br>
<br>
- device-tree.bbappend + files/*.dtsi (Xen DT overlay includes for<br>
=C2=A0 zynqmp/versal/versal-net) are duplicated, with additional<br>
=C2=A0 versal-2vp and TARGET_OS-guard support, by<br>
=C2=A0 meta-xilinx/meta-xilinx-virtualization/recipes-bsp/device-tree.<br>
<br>
- u-boot-xlnx-scr.bbappend + xen-boot-cmd.inc + boot.cmd.xen provided<br>
=C2=A0 an ENABLE_XEN_UBOOT_SCR-gated Xen boot.scr flow bolted onto<br>
=C2=A0 u-boot-xlnx-scr. The standalone u-boot-xen-scr recipe in<br>
=C2=A0 meta-xilinx/meta-xilinx-virtualization (selected via<br>
=C2=A0 UBOOT_BOOT_SCRIPT:append =3D &quot; u-boot-xen-scr&quot;, see<br>
=C2=A0 meta-xilinx-virtualization/<a href=3D"http://README.xen.boot.scr.md"=
 rel=3D"noreferrer" target=3D"_blank">README.xen.boot.scr.md</a>) is the<br=
>
=C2=A0 supported replacement, generating xen_boot.scr via the Xen<br>
=C2=A0 image-builder dom0/dom0less template configs instead.<br></blockquot=
e><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small=
">Except that we don&#39;t have a layer dependency on the xilinx layers in<=
/div><div class=3D"gmail_default" style=3D"font-size:small">meta-virtualiza=
tion. Those were supposed to be captured upstream</div><div class=3D"gmail_=
default" style=3D"font-size:small">references (I&#39;m not saying they are,=
 but that was the intent).</div><div class=3D"gmail_default" style=3D"font-=
size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small=
">So I&#39;d rather not delete them, then have a dependency on some</div><d=
iv class=3D"gmail_default" style=3D"font-size:small">sort of nested virtual=
ization layer within the xilinx layer, I fail to see</div><div class=3D"gma=
il_default" style=3D"font-size:small">how that makes anything easier to use=
.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><di=
v class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Sandeep Gundlupet Raju &lt;<a href=3D"mailto:sandeep.gundlup=
et-raju@amd.com" target=3D"_blank">sandeep.gundlupet-raju@amd.com</a>&gt;<b=
r>
---<br>
=C2=A0.../device-tree/device-tree.bbappend=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 19 ---<br>
=C2=A0.../files/versal-net-xen-qemu.dtsi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A02 -<br>
=C2=A0.../device-tree/files/versal-net-xen.dtsi=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
67 ----------<br>
=C2=A0.../device-tree/files/versal-xen-qemu.dtsi=C2=A0 =C2=A0 |=C2=A0 =C2=
=A02 -<br>
=C2=A0.../device-tree/files/versal-xen.dtsi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 59 ---------<br>
=C2=A0.../device-tree/files/zynqmp-xen-qemu.dtsi=C2=A0 =C2=A0 |=C2=A0 =C2=
=A02 -<br>
=C2=A0.../device-tree/files/zynqmp-xen.dtsi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 123 ------------------<br>
=C2=A0.../u-boot/u-boot-xlnx-scr.bbappend=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A04 -<br>
=C2=A0.../u-boot/u-boot-xlnx-scr/boot.cmd.xen=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 80 ------------<br>
=C2=A0.../recipes-bsp/u-boot/xen-boot-cmd.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 38 ------<br>
=C2=A010 files changed, 396 deletions(-)<br>
=C2=A0delete mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/devi=
ce-tree.bbappend<br>
=C2=A0delete mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/file=
s/versal-net-xen-qemu.dtsi<br>
=C2=A0delete mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/file=
s/versal-net-xen.dtsi<br>
=C2=A0delete mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/file=
s/versal-xen-qemu.dtsi<br>
=C2=A0delete mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/file=
s/versal-xen.dtsi<br>
=C2=A0delete mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/file=
s/zynqmp-xen-qemu.dtsi<br>
=C2=A0delete mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/file=
s/zynqmp-xen.dtsi<br>
=C2=A0delete mode 100644 dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xl=
nx-scr.bbappend<br>
=C2=A0delete mode 100644 dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xl=
nx-scr/boot.cmd.xen<br>
=C2=A0delete mode 100644 dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-=
cmd.inc<br>
<br>
diff --git a/dynamic-layers/xilinx/recipes-bsp/device-tree/device-tree.bbap=
pend b/dynamic-layers/xilinx/recipes-bsp/device-tree/device-tree.bbappend<b=
r>
deleted file mode 100644<br>
index 813c08f8..00000000<br>
--- a/dynamic-layers/xilinx/recipes-bsp/device-tree/device-tree.bbappend<br=
>
+++ /dev/null<br>
@@ -1,19 +0,0 @@<br>
-FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}/files:&quot;<br>
-<br>
-ENABLE_XEN_DTSI ?=3D &quot;&quot;<br>
-ENABLE_XEN_QEMU_DTSI ?=3D &quot;&quot;<br>
-<br>
-XEN_EXTRA_DT_INCLUDE_FILES =3D &quot;&quot;<br>
-XEN_EXTRA_QEMU_DT_INCLUDE_FILES =3D &quot;&quot;<br>
-<br>
-XEN_EXTRA_DT_INCLUDE_FILES:zynqmp =3D &quot;zynqmp-xen.dtsi&quot;<br>
-XEN_EXTRA_QEMU_DT_INCLUDE_FILES:zynqmp =3D &quot;zynqmp-xen.dtsi zynqmp-xe=
n-qemu.dtsi&quot;<br>
-<br>
-XEN_EXTRA_DT_INCLUDE_FILES:versal =3D &quot;versal-xen.dtsi&quot;<br>
-XEN_EXTRA_QEMU_DT_INCLUDE_FILES:versal =3D &quot;versal-xen.dtsi versal-xe=
n-qemu.dtsi&quot;<br>
-<br>
-XEN_EXTRA_DT_INCLUDE_FILES:versal-net =3D &quot;versal-net-xen.dtsi&quot;<=
br>
-XEN_EXTRA_QEMU_DT_INCLUDE_FILES:versal-net =3D &quot;versal-net-xen.dtsi v=
ersal-net-xen-qemu.dtsi&quot;<br>
-<br>
-EXTRA_DT_INCLUDE_FILES:append =3D &quot;${@&#39; ${XEN_EXTRA_DT_INCLUDE_FI=
LES}&#39; if d.getVar(&#39;ENABLE_XEN_DTSI&#39;) =3D=3D &#39;1&#39; else &#=
39;&#39;}&quot;<br>
-EXTRA_DT_INCLUDE_FILES:append =3D &quot;${@&#39; ${XEN_EXTRA_QEMU_DT_INCLU=
DE_FILES}&#39; if d.getVar(&#39;ENABLE_XEN_QEMU_DTSI&#39;) =3D=3D &#39;1&#3=
9; else &#39;&#39;}&quot;<br>
diff --git a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-net=
-xen-qemu.dtsi b/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal=
-net-xen-qemu.dtsi<br>
deleted file mode 100644<br>
index 336d7a25..00000000<br>
--- a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-net-xen-qe=
mu.dtsi<br>
+++ /dev/null<br>
@@ -1,2 +0,0 @@<br>
-/ {<br>
-};<br>
diff --git a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-net=
-xen.dtsi b/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-net-=
xen.dtsi<br>
deleted file mode 100644<br>
index 7da1f9f1..00000000<br>
--- a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-net-xen.dt=
si<br>
+++ /dev/null<br>
@@ -1,67 +0,0 @@<br>
-&amp;smmu {<br>
-=C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
-};<br>
-<br>
-&amp;adma0 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x210&gt;;<br>
-};<br>
-<br>
-&amp;adma1 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x212&gt;;<br>
-};<br>
-<br>
-&amp;adma2 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x214&gt;;<br>
-};<br>
-<br>
-&amp;adma3 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x216&gt;;<br>
-};<br>
-<br>
-&amp;adma4 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x218&gt;;<br>
-};<br>
-<br>
-&amp;adma5 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x21a&gt;;<br>
-};<br>
-<br>
-&amp;adma6 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x21c&gt;;<br>
-};<br>
-<br>
-&amp;adma7 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x21e&gt;;<br>
-};<br>
-<br>
-&amp;dwc3_0 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x230&gt;;<br>
-};<br>
-<br>
-&amp;dwc3_1 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x232&gt;;<br>
-};<br>
-<br>
-&amp;gem0 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x234&gt;;<br>
-};<br>
-<br>
-&amp;gem1 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x235&gt;;<br>
-};<br>
-<br>
-&amp;sdhci0 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x242&gt;;<br>
-};<br>
-<br>
-&amp;sdhci1 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x243&gt;;<br>
-};<br>
-<br>
-&amp;qspi {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x244&gt;;<br>
-};<br>
-<br>
-&amp;ospi {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x245&gt;;<br>
-};<br>
diff --git a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-xen=
-qemu.dtsi b/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-xen=
-qemu.dtsi<br>
deleted file mode 100644<br>
index 336d7a25..00000000<br>
--- a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-xen-qemu.d=
tsi<br>
+++ /dev/null<br>
@@ -1,2 +0,0 @@<br>
-/ {<br>
-};<br>
diff --git a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-xen=
.dtsi b/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-xen.dtsi=
<br>
deleted file mode 100644<br>
index 6782e925..00000000<br>
--- a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-xen.dtsi<b=
r>
+++ /dev/null<br>
@@ -1,59 +0,0 @@<br>
-&amp;smmu {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
-};<br>
-<br>
-&amp;gem0 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x234&gt;;<br>
-};<br>
-<br>
-&amp;gem1 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x235&gt;;<br>
-};<br>
-<br>
-&amp;dwc3_0 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x230&gt;;<br>
-};<br>
-<br>
-&amp;qspi {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x244&gt;;<br>
-};<br>
-<br>
-&amp;lpd_dma_chan0 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x210&gt;;<br>
-};<br>
-<br>
-&amp;lpd_dma_chan1 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x212&gt;;<br>
-};<br>
-<br>
-&amp;lpd_dma_chan2 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x214&gt;;<br>
-};<br>
-<br>
-&amp;lpd_dma_chan3 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x216&gt;;<br>
-};<br>
-<br>
-&amp;lpd_dma_chan4 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x218&gt;;<br>
-};<br>
-<br>
-&amp;lpd_dma_chan5 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x21a&gt;;<br>
-};<br>
-<br>
-&amp;lpd_dma_chan6 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x21c&gt;;<br>
-};<br>
-<br>
-&amp;lpd_dma_chan7 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x21e&gt;;<br>
-};<br>
-<br>
-&amp;sdhci0 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x242&gt;;<br>
-};<br>
-<br>
-&amp;sdhci1 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x243&gt;;<br>
-};<br>
diff --git a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen=
-qemu.dtsi b/dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen=
-qemu.dtsi<br>
deleted file mode 100644<br>
index 336d7a25..00000000<br>
--- a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen-qemu.d=
tsi<br>
+++ /dev/null<br>
@@ -1,2 +0,0 @@<br>
-/ {<br>
-};<br>
diff --git a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen=
.dtsi b/dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen.dtsi=
<br>
deleted file mode 100644<br>
index 3d75be65..00000000<br>
--- a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen.dtsi<b=
r>
+++ /dev/null<br>
@@ -1,123 +0,0 @@<br>
-&amp;smmu {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
-};<br>
-<br>
-&amp;gem0 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x874&gt;;<br>
-};<br>
-<br>
-&amp;gem1 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x875&gt;;<br>
-};<br>
-<br>
-&amp;gem2 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x876&gt;;<br>
-};<br>
-<br>
-&amp;gem3 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x877&gt;;<br>
-};<br>
-<br>
-&amp;dwc3_0 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x860&gt;;<br>
-};<br>
-<br>
-&amp;dwc3_1 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x861&gt;;<br>
-};<br>
-<br>
-&amp;qspi {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x873&gt;;<br>
-};<br>
-<br>
-&amp;lpd_dma_chan1 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x868&gt;;<br>
-};<br>
-<br>
-&amp;lpd_dma_chan2 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x869&gt;;<br>
-};<br>
-<br>
-&amp;lpd_dma_chan3 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x86a&gt;;<br>
-};<br>
-<br>
-&amp;lpd_dma_chan4 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x86b&gt;;<br>
-};<br>
-<br>
-&amp;lpd_dma_chan5 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x86c&gt;;<br>
-};<br>
-<br>
-&amp;lpd_dma_chan6 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x86d&gt;;<br>
-};<br>
-<br>
-&amp;lpd_dma_chan7 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x86e&gt;;<br>
-};<br>
-<br>
-&amp;lpd_dma_chan8 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x86f&gt;;<br>
-};<br>
-<br>
-&amp;fpd_dma_chan1 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x14e8&gt;;<br>
-};<br>
-<br>
-&amp;fpd_dma_chan2 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x14e9&gt;;<br>
-};<br>
-<br>
-&amp;fpd_dma_chan3 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x14ea&gt;;<br>
-};<br>
-<br>
-&amp;fpd_dma_chan4 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x14eb&gt;;<br>
-};<br>
-<br>
-&amp;fpd_dma_chan5 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x14ec&gt;;<br>
-};<br>
-<br>
-&amp;fpd_dma_chan6 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x14ed&gt;;<br>
-};<br>
-<br>
-&amp;fpd_dma_chan7 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x14ee&gt;;<br>
-};<br>
-<br>
-&amp;fpd_dma_chan8 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x14ef&gt;;<br>
-};<br>
-<br>
-&amp;sdhci0 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x870&gt;;<br>
-};<br>
-<br>
-&amp;sdhci1 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x871&gt;;<br>
-};<br>
-<br>
-&amp;nand0 {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x872&gt;;<br>
-};<br>
-<br>
-&amp;pcie {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x4d0&gt;;<br>
-};<br>
-<br>
-&amp;zynqmp_dpsub {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0xce3&gt;;<br>
-};<br>
-<br>
-&amp;zynqmp_dpdma {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0xce4&gt;;<br>
-};<br>
-<br>
-&amp;sata {<br>
-=C2=A0 =C2=A0 iommus =3D &lt;&amp;smmu 0x4c0&gt;, &lt;&amp;smmu 0x4c1&gt;,=
 &lt;&amp;smmu 0x4c2&gt;, &lt;&amp;smmu 0x4c3&gt;;<br>
-};<br>
diff --git a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbapp=
end b/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend<br>
deleted file mode 100644<br>
index ec64d246..00000000<br>
--- a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend<br>
+++ /dev/null<br>
@@ -1,4 +0,0 @@<br>
-# Include xen-boot-cmd.inc only if ENABLE_XEN_UBOOT_SCR is set from config=
uration<br>
-# file and xen enabled in DISTRO_FEATURES.<br>
-ENABLE_XEN_UBOOT_SCR ?=3D &quot;&quot;<br>
-include ${@&#39;xen-boot-cmd.inc&#39; if d.getVar(&#39;ENABLE_XEN_UBOOT_SC=
R&#39;) =3D=3D &#39;1&#39; and bb.utils.contains(&#39;DISTRO_FEATURES&#39;,=
 &#39;xen&#39;, True, False, d) else &#39;&#39;}<br>
diff --git a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr/boot.=
cmd.xen b/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr/boot.cmd=
.xen<br>
deleted file mode 100644<br>
index 25e5842c..00000000<br>
--- a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr/boot.cmd.xen=
<br>
+++ /dev/null<br>
@@ -1,80 +0,0 @@<br>
-# This is a boot script for U-Boot with Xen parameters used by yocto machi=
ne<br>
-# configuration file.<br>
-# Generate boot.scr:<br>
-# mkimage -c none -A arm -T script -d boot.cmd.xen boot.scr<br>
-#<br>
-################<br>
-xen_name=3D@@XEN_IMAGE_NAME@@<br>
-kernel_name=3D@@KERNEL_IMAGE@@<br>
-rootfs_name=3D@@RAMDISK_IMAGE@@<br>
-@@PRE_BOOTENV@@<br>
-<br>
-for boot_target in ${boot_targets};<br>
-do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Trying to load boot images from ${bo=
ot_target}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if test &quot;${boot_target}&quot; =3D &quot;jt=
ag&quot; ; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tftpboot @@KERNEL_L=
OAD_ADDRESS@@ ${kernel_name}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0setenv kernel_size =
0x$filesize;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tftpboot @@RAMDISK_=
IMAGE_ADDRESS@@ ${rootfs_name}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0setenv ramdisk_size=
 0x$filesize;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tftpboot @@XEN_LOAD=
_ADDRESS@@ ${xen_name}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tftpboot @@DEVICETR=
EE_ADDRESS@@ system.dtb<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if test &quot;${boot_target}&quot; =3D &quot;mm=
c0&quot; || test &quot;${boot_target}&quot; =3D &quot;mmc1&quot; || test &q=
uot;${boot_target}&quot; =3D &quot;usb0&quot; || test &quot;${boot_target}&=
quot; =3D &quot;usb1&quot;; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if test &quot;${boo=
t_target}&quot; =3D &quot;mmc0&quot; || test &quot;${boot_target}&quot; =3D=
 &quot;mmc1&quot;; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0setenv bootdev mmcblk${devnum}p<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if test &quot;${boo=
t_target}&quot; =3D &quot;usb0&quot; || test &quot;${boot_target}&quot; =3D=
 &quot;usb1&quot;; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0setenv bootdev sda<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Checking=
 for /${xen_name}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if test -e ${devtyp=
e} ${devnum}:${distro_bootpart} /${xen_name}; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0echo &quot;Loading ${xen_name}&quot;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fatload ${devtype} ${devnum}:${distro_bootpart} @@XEN_LOAD_ADDRES=
S@@ ${xen_name};<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Checking=
 for /${kernel_name}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if test -e ${devtyp=
e} ${devnum}:${distro_bootpart} /${kernel_name}; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0echo &quot;Loading ${kernel_name}&quot;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fatload ${devtype} ${devnum}:${distro_bootpart} @@KERNEL_LOAD_ADD=
RESS@@ ${kernel_name};<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0setenv kernel_size 0x$filesize;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Checking=
 for /system.dtb&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if test -e ${devtyp=
e} ${devnum}:${distro_bootpart} /system.dtb; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0echo &quot;Loading system.dtb&quot;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fatload ${devtype} ${devnum}:${distro_bootpart} @@DEVICETREE_ADDR=
ESS@@ system.dtb;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Checking=
 for /${rootfs_name}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if test -e ${devtyp=
e} ${devnum}:${distro_bootpart} /${rootfs_name} &amp;&amp; test &quot;${ski=
p_ramdisk}&quot; !=3D &quot;yes&quot;; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0echo &quot;Loading ${rootfs_name}&quot;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fatload ${devtype} ${devnum}:${distro_bootpart} @@RAMDISK_IMAGE_A=
DDRESS@@ ${rootfs_name};<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0setenv ramdisk_size 0x$filesize;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fdt addr @@DEVICETREE_ADDRESS@@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fdt resize 0x1000<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fdt get value bootargs /chosen bootargs<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fdt set /chosen \#address-cells &lt;0x2&gt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fdt set /chosen \#size-cells &lt;0x2&gt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0setenv xen_bootargs &quot;console=3Ddtuart dtua=
rt=3D@@XEN_SERIAL_CONSOLES@@ dom0_mem=3D@@DOM0_MEM@@ dom0_max_vcpus=3D@@DOM=
0_MAX_VCPUS@@ bootscrub=3D0 vwfi=3Dnative @@XEN_CMDLINE_APPEND@@&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fdt set /chosen xen,xen-bootargs \&quot;${xen_b=
ootargs}\&quot;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Check that env $ramdisk_size is 0 or not.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if test -n ${ramdisk_size}; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fdt mknod /chosen d=
om0-ramdisk<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fdt set /chosen/dom=
0-ramdisk compatible=C2=A0 &quot;xen,linux-initrd&quot; &quot;xen,multiboot=
-module&quot; &quot;multiboot,module&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fdt set /chosen/dom=
0-ramdisk reg &lt;0x0 @@RAMDISK_IMAGE_ADDRESS@@ 0x0 ${ramdisk_size}&gt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0setenv rootfs_param=
 @@KERNEL_ROOT_RAMDISK@@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0setenv rootfs_param=
 @@KERNEL_ROOT_SD@@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fdt mknod /chosen dom0<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fdt set /chosen/dom0 compatible=C2=A0 &quot;xen=
,linux-zimage&quot; &quot;xen,multiboot-module&quot; &quot;multiboot,module=
&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fdt set /chosen/dom0 reg &lt;0x0 @@KERNEL_LOAD_=
ADDRESS@@ 0x0 ${kernel_size}&gt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0setenv dom0_bootargs &quot;console=3Dhvc0 early=
con=3Dxen earlyprintk=3Dxen clk_ignore_unused ${rootfs_param}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fdt set /chosen xen,dom0-bootargs \&quot;${dom0=
_bootargs}\&quot;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0setenv fdt_high 0xffffffffffffffff<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0@@KERNEL_BOOTCMD@@ @@XEN_LOAD_ADDRESS@@ - @@DEV=
ICETREE_ADDRESS@@<br>
-done<br>
diff --git a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc b/dy=
namic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc<br>
deleted file mode 100644<br>
index 7a4e41a6..00000000<br>
--- a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc<br>
+++ /dev/null<br>
@@ -1,38 +0,0 @@<br>
-FILESEXTRAPATHS:append :=3D &quot;:${THISDIR}/u-boot-xlnx-scr&quot;<br>
-<br>
-SRC_URI +=3D &quot;file://boot.cmd.xen&quot;<br>
- <br>
-# Image offsets for Xen boot<br>
-KERNEL_OFFSET:zynqmp ?=3D &quot;0xE00000&quot;<br>
-KERNEL_OFFSET:versal ?=3D &quot;0xE00000&quot;<br>
-<br>
-DEVICETREE_OFFSET:zynqmp ?=3D &quot;0xC000000&quot;<br>
-DEVICETREE_OFFSET:versal ?=3D &quot;0xC000000&quot;<br>
-<br>
-RAMDISK_OFFSET:zynqmp ?=3D &quot;0x2600000&quot;<br>
-RAMDISK_OFFSET:versal ?=3D &quot;0x2600000&quot;<br>
-<br>
-XEN_OFFSET:zynqmp ?=3D &quot;0xBA00000&quot;<br>
-XEN_OFFSET:versal ?=3D &quot;0xBA00000&quot;<br>
-XEN_LOAD_ADDRESS ?=3D &quot;${@append_baseaddr(d,d.getVar(&#39;XEN_OFFSET&=
#39;))}&quot;<br>
-<br>
-# If dom0-ramdisk is used for Xen boot then set RAMDISK image to cpio.gz<b=
r>
-XEN_IMAGE_NAME ?=3D &quot;xen&quot;<br>
-RAMDISK_IMAGE ?=3D &quot;rootfs.cpio.gz&quot;<br>
-<br>
-# Set the amount of memory for dom0 depending on total available memory si=
ze(DDR).<br>
-DOM0_MEM ?=3D &quot;1500M&quot;<br>
-<br>
-# Specify which UART console Xen should use. You can sepecify the devicetr=
ee<br>
-# alias or full path to a node in the devicetree<br>
-# XEN_SERIAL_CONSOLES ?=3D &quot;serial0&quot; or XEN_SERIAL_CONSOLES ?=3D=
 &quot;/axi/serial@ff000000&quot;<br>
-XEN_SERIAL_CONSOLES ?=3D &quot;serial0&quot;<br>
-<br>
-# Specify additional Xen paramaters which will be appended to xen-bootargs=
<br>
-# This can alos be used for debugging purposes.<br>
-# Examples: XEN_CMDLINE_APPEND ?=3D &quot;sched=3Dcredit loglvl=3Dall gues=
t_loglvl=3Ddebug&quot;<br>
-XEN_CMDLINE_APPEND ?=3D &quot;&quot;<br>
-<br>
-# Specify the max number of vcpus for dom0<br>
-# Example usage: DOM0_MAX_VCPUS =3D &quot;2&quot; or DOM0_MAX_VCPUS =3D &q=
uot;2-4&quot;<br>
-DOM0_MAX_VCPUS ?=3D &quot;1&quot;<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000e4e3c5065bb966c5--

