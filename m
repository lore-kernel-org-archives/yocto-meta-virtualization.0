Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7AE9C3DA41
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 03:53:36 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.6223.1720583616229287804
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Jul 2024 20:53:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dtq1hYxs;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-447fd75f9aeso8015891cf.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Jul 2024 20:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720583615; x=1721188415; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HZgkqhRhK//YF/GaTpIyMg1BVgOb8WW+9FCp6uCDcVs=;
        b=Dtq1hYxslccP/zS+QuutZPJvQN1TJRqYCzkp2tWgFnBVd4RI+4oOXr/FPXCuVXYhSK
         nOD51ePG0MaFvS4a2XOoA7jJvzBZwaLUGmePFaPbI/3RoUZDvOeeliAz4A1A/GCAF2Dh
         45BvgWjZkVw21d1JmMvXhMpT6vG1VepNDlrbrLTaZMgaIBFPe8kCjZznjqUEfD5Xjcxl
         GEduB0AUTk5avbDO6uZ5zwY65eqrdrhHNOduoXAKIqFuo7vvlHHKY+UlzAo3+iGRrFS6
         6V15RcsGb4KSSm2XPYmrdQP6FVJa5UjaHMvrsdb8rT6ChI5w5KIPXc3wpao8ATjfViQ4
         bUPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720583615; x=1721188415;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HZgkqhRhK//YF/GaTpIyMg1BVgOb8WW+9FCp6uCDcVs=;
        b=p+aKmWiTXsd6x2pIKgHjlRNKIGO2UxHdjTwpV0MJJEAlQeIRIeZQPYve9vJEp++SRs
         2BLmE41dytqrtNB7BRSF6g5gULkcRRVZPn5cv6mPkkUBqpIMsn/L4su3l2W2+91AHd1i
         TvCJqFZtpG2STYQitCVvePhqp3zH0dvOVgklOoPB97jfCEw3evX7B34oE0Q4voaNJAWP
         I152/OwImG4SHAINSeKi1a/NctHmF1UQmgok8BOqjz/yy3nXi0D3vBgmfwYVB4Pt+uwf
         FWHn84AX92tUwvC6LmsLa/y+DuMi8hviKDj2q+6LEBu0Lz7dEtC2WeusjC1FNxwNuiSq
         sYKQ==
X-Gm-Message-State: AOJu0Yy3B02df5/qceqwknOPE8gcEH4X5+EFkx1d8cfrRaB9odJ+gwsx
	U/KFwPARoaIVbhmTo4RSraqTtz469rDv4LYLKaup25EFVH3CpUw3
X-Google-Smtp-Source: AGHT+IEp5rA1fhZsTmR+42yNwN+D/s1HdwOo5TYTDcjCwQ+usf4uWBRUan41qS6xqUmuAkmdZ3ni0Q==
X-Received: by 2002:ac8:5ac6:0:b0:447:e808:ab24 with SMTP id d75a77b69052e-447fa908876mr43257181cf.50.1720583614897;
        Tue, 09 Jul 2024 20:53:34 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-447f9bf229dsm16678261cf.79.2024.07.09.20.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 20:53:34 -0700 (PDT)
Date: Wed, 10 Jul 2024 03:53:32 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: asharma@mvista.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][kirkstone][PATCH] libvirt: Fix
 CVE-2024-1441 and CVE-2024-2496
Message-ID: <Zo4FvN5/kwqcgCax@gmail.com>
References: <20240626062153.27763-1-asharma@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240626062153.27763-1-asharma@mvista.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Jul 2024 03:53:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8823

merged to kirkstone.

Bruce

In message: [meta-virtualization][kirkstone][PATCH] libvirt: Fix CVE-2024-1441 and CVE-2024-2496
on 26/06/2024 Ashish Sharma via lists.yoctoproject.org wrote:

> Upstream-Status: Backport from [https://launchpad.net/ubuntu/+source/libvirt/8.0.0-1ubuntu7.10]
> 
> import Ubuntu patches to fix
>    CVE-2024-1441
>    CVE-2024-2496
> Signed-off-by: Ashish Sharma <asharma@mvista.com>
> ---
>  .../libvirt/libvirt/CVE-2024-1441.patch       | 64 +++++++++++++
>  .../libvirt/libvirt/CVE-2024-2496.patch       | 91 +++++++++++++++++++
>  recipes-extended/libvirt/libvirt_8.1.0.bb     |  2 +
>  3 files changed, 157 insertions(+)
>  create mode 100644 recipes-extended/libvirt/libvirt/CVE-2024-1441.patch
>  create mode 100644 recipes-extended/libvirt/libvirt/CVE-2024-2496.patch
> 
> diff --git a/recipes-extended/libvirt/libvirt/CVE-2024-1441.patch b/recipes-extended/libvirt/libvirt/CVE-2024-1441.patch
> new file mode 100644
> index 00000000..5a17e9c5
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/CVE-2024-1441.patch
> @@ -0,0 +1,64 @@
> +From c664015fe3a7bf59db26686e9ed69af011c6ebb8 Mon Sep 17 00:00:00 2001
> +From: Martin Kletzander <mkletzan@redhat.com>
> +Date: Tue, 27 Feb 2024 16:20:12 +0100
> +Subject: [PATCH] Fix off-by-one error in udevListInterfacesByStatus
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Ever since this function was introduced in 2012 it could've tried
> +filling in an extra interface name.  That was made worse in 2019 when
> +the caller functions started accepting NULL arrays of size 0.
> +
> +This is assigned CVE-2024-1441.
> +
> +Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
> +Reported-by: Alexander Kuznetsov <kuznetsovam@altlinux.org>
> +Fixes: 5a33366f5c0b18c93d161bd144f9f079de4ac8ca
> +Fixes: d6064e2759a24e0802f363e3a810dc5a7d7ebb15
> +Reviewed-by: J�n Tomko <jtomko@redhat.com>
> +
> +Upstream-Status: Backport from [https://launchpad.net/ubuntu/+source/libvirt/8.0.0-1ubuntu7.10]
> +CVE: CVE-2024-1441
> +Signed-off-by: Ashish Sharma <asharma@mvista.com>
> +
> +
> + NEWS.rst                               | 15 +++++++++++++++
> + src/interface/interface_backend_udev.c |  2 +-
> + 2 files changed, 16 insertions(+), 1 deletion(-)
> +
> +#--- a/NEWS.rst
> +#+++ b/NEWS.rst
> +#@@ -312,6 +312,21 @@ v9.2.0 (2023-04-01)
> +# v9.1.0 (2023-03-01)
> +# ===================
> +# 
> +#+  * ``CVE-2024-1441``: Fix off-by-one error leading to a crash
> +#+
> +#+    In **libvirt-1.0.0** there were couple of interface listing APIs
> +#+    introduced which had an off-by-one error.  That error could lead to a
> +#+    very rare crash if an array was passed to those functions which did
> +#+    not fit all the interfaces.
> +#+
> +#+    In **libvirt-5.10** a check for non-NULL arrays has been adjusted to
> +#+    allow for NULL arrays with size 0 instead of rejecting all NULL
> +#+    arrays.  However that made the above issue significantly worse since
> +#+    that off-by-one error now did not write beyond an array, but
> +#+    dereferenced said NULL pointer making the crash certain in a
> +#+    specific scenario in which a NULL array of size 0 was passed to the
> +#+    aforementioned functions.
> +#+
> +# * **Removed features**
> +# 
> +#   * vbox: removed support for version 5.2 and 6.0 APIs
> +--- a/src/interface/interface_backend_udev.c
> ++++ b/src/interface/interface_backend_udev.c
> +@@ -220,7 +220,7 @@ udevListInterfacesByStatus(virConnectPtr
> +         g_autoptr(virInterfaceDef) def = NULL;
> + 
> +         /* Ensure we won't exceed the size of our array */
> +-        if (count > names_len)
> ++        if (count >= names_len)
> +             break;
> + 
> +         path = udev_list_entry_get_name(dev_entry);
> diff --git a/recipes-extended/libvirt/libvirt/CVE-2024-2496.patch b/recipes-extended/libvirt/libvirt/CVE-2024-2496.patch
> new file mode 100644
> index 00000000..ec477b05
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/CVE-2024-2496.patch
> @@ -0,0 +1,91 @@
> +Backport of:
> +
> +From 2ca94317ac642a70921947150ced8acc674ccdc8 Mon Sep 17 00:00:00 2001
> +From: Dmitry Frolov <frolov@swemel.ru>
> +Date: Tue, 12 Sep 2023 15:56:47 +0300
> +Subject: [PATCH] interface: fix udev_device_get_sysattr_value return value
> + check
> +
> +Reviewing the code I found that return value of function
> +udev_device_get_sysattr_value() is dereferenced without a check.
> +udev_device_get_sysattr_value() may return NULL by number of reasons.
> +
> +v2: VIR_DEBUG added, replaced STREQ(NULLSTR()) with STREQ_NULLABLE()
> +v3: More checks added, to skip earlier. More verbose VIR_DEBUG.
> +
> +Signed-off-by: Dmitry Frolov <frolov@swemel.ru>
> +Reviewed-by: Martin Kletzander <mkletzan@redhat.com>
> +
> +Upstream-Status: Backport from [https://launchpad.net/ubuntu/+source/libvirt/8.0.0-1ubuntu7.10]
> +CVE: CVE-2024-2496
> +Signed-off-by: Ashish Sharma <asharma@mvista.com>
> +
> +
> + src/interface/interface_backend_udev.c | 26 +++++++++++++++++++-------
> + 1 file changed, 19 insertions(+), 7 deletions(-)
> +
> +--- a/src/interface/interface_backend_udev.c
> ++++ b/src/interface/interface_backend_udev.c
> +@@ -23,6 +23,7 @@
> + #include <dirent.h>
> + #include <libudev.h>
> + 
> ++#include "virlog.h"
> + #include "virerror.h"
> + #include "virfile.h"
> + #include "datatypes.h"
> +@@ -41,6 +42,8 @@
> + 
> + #define VIR_FROM_THIS VIR_FROM_INTERFACE
> + 
> ++VIR_LOG_INIT("interface.interface_backend_udev");
> ++
> + struct udev_iface_driver {
> +     struct udev *udev;
> +     /* pid file FD, ensures two copies of the driver can't use the same root */
> +@@ -355,11 +358,20 @@ udevConnectListAllInterfaces(virConnectP
> +         const char *macaddr;
> +         g_autoptr(virInterfaceDef) def = NULL;
> + 
> +-        path = udev_list_entry_get_name(dev_entry);
> +-        dev = udev_device_new_from_syspath(udev, path);
> +-        name = udev_device_get_sysname(dev);
> ++        if (!(path = udev_list_entry_get_name(dev_entry))) {
> ++            VIR_DEBUG("Skipping interface, path == NULL");
> ++            continue;
> ++        }
> ++        if (!(dev = udev_device_new_from_syspath(udev, path))) {
> ++            VIR_DEBUG("Skipping interface '%s', dev == NULL", path);
> ++            continue;
> ++        }
> ++        if (!(name = udev_device_get_sysname(dev))) {
> ++            VIR_DEBUG("Skipping interface '%s', name == NULL", path);
> ++            continue;
> ++        }
> +         macaddr = udev_device_get_sysattr_value(dev, "address");
> +-        status = STREQ(udev_device_get_sysattr_value(dev, "operstate"), "up");
> ++        status = STREQ_NULLABLE(udev_device_get_sysattr_value(dev, "operstate"), "up");
> + 
> +         def = udevGetMinimalDefForDevice(dev);
> +         if (!virConnectListAllInterfacesCheckACL(conn, def)) {
> +@@ -969,9 +981,9 @@ udevGetIfaceDef(struct udev *udev, const
> + 
> +     /* MTU */
> +     mtu_str = udev_device_get_sysattr_value(dev, "mtu");
> +-    if (virStrToLong_ui(mtu_str, NULL, 10, &mtu) < 0) {
> ++    if (!mtu_str || virStrToLong_ui(mtu_str, NULL, 10, &mtu) < 0) {
> +         virReportError(VIR_ERR_INTERNAL_ERROR,
> +-                _("Could not parse MTU value '%s'"), mtu_str);
> ++                _("Could not parse MTU value '%1$s'"), NULLSTR(mtu_str));
> +         goto error;
> +     }
> +     ifacedef->mtu = mtu;
> +@@ -1094,7 +1106,7 @@ udevInterfaceIsActive(virInterfacePtr if
> +        goto cleanup;
> + 
> +     /* Check if it's active or not */
> +-    status = STREQ(udev_device_get_sysattr_value(dev, "operstate"), "up");
> ++    status = STREQ_NULLABLE(udev_device_get_sysattr_value(dev, "operstate"), "up");
> + 
> +     udev_device_unref(dev);
> + 
> diff --git a/recipes-extended/libvirt/libvirt_8.1.0.bb b/recipes-extended/libvirt/libvirt_8.1.0.bb
> index a88e0ee3..ef9c1c6e 100644
> --- a/recipes-extended/libvirt/libvirt_8.1.0.bb
> +++ b/recipes-extended/libvirt/libvirt_8.1.0.bb
> @@ -31,6 +31,8 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
>             file://0001-qemu-segmentation-fault-in-virtqemud-executing-qemuD.patch \
>             file://CVE-2023-2700.patch \
>             file://CVE-2024-2494.patch \
> +           file://CVE-2024-1441.patch \
> +           file://CVE-2024-2496.patch \
>            "
>  
>  SRC_URI[libvirt.sha256sum] = "3c6c43becffeb34a3f397c616206aa69a893ff8bf5e8208393c84e8e75352934"
> -- 
> 2.35.7
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8815): https://lists.yoctoproject.org/g/meta-virtualization/message/8815
> Mute This Topic: https://lists.yoctoproject.org/mt/106885393/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


