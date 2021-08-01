Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web10.8373.1627832176752878367
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 01 Aug 2021 08:36:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=eapv/iLj;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.181, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f181.google.com with SMTP id az7so14375350qkb.5
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 01 Aug 2021 08:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=NKqTKWlOBe3mpnM9fXBk0UUFyai29Fk35z/Sn0Mcxzk=;
        b=eapv/iLjMIio25vMH9Nw8p+hmzh7E4fjXio8ZOPfj+T2zGc/JJwr4qDK/KN5OEoXFH
         xy7Ev8Kd94qkH8eFfGQRpizsUs/vF3J6vWRoeRa7e3IaRTjljAfnceYnMDdiMo/HuWEy
         m8653nNtYn5/SO60e2wNMl8wkYkC3G5dmJIJAhS9K3QdeSbgaWs9sD19hCDUdrevH3B4
         bG+Ijxg4XOZ1et9HuzcrXUIua/+QdTEVFwR9Ed38kQRI0b/QOCJtegZDHrHCgEFg+VQ2
         NTKzTeAaav6XmMnsZD1pYdeFkpip2f4SyRBWwwkwwJiIfgoF8b6PN96FyXzElUnYdMqv
         ejyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=NKqTKWlOBe3mpnM9fXBk0UUFyai29Fk35z/Sn0Mcxzk=;
        b=Lmnaek++TSdj5Z3HWNignfQitv7o/tI01cIU10Np0yGLKgaRw45uNjbYgUgzfVual6
         MVuCjAZKn7tM3la3WHRvvS0VTjXP/Lf8ao4rxYP+yd1BOoWlhVQi75gC/i+hZh1chXRN
         oEOyGiKUcgwOigYNitty+wEY7Zpl8IIIbXEO04f0TpprUznhqc5XWhOq1WeRcpItQ26A
         CuyoJpFi7F/9TLwd/dPxSdBHzRWFehXwIkkRFJSMXSwy5SwuCAfYkp/+FOgmWXG725yk
         w7Q66VRFeESVHZVfgKVCu6HWAISU8WtK9bm3ETvu6FkmsdRxOWhNqgzm4ZNSduVdOW6Y
         d28Q==
X-Gm-Message-State: AOAM533xbz9H8hsCrp0LeOe14V+/nQCYBGbfO74ycqYTd6l5FAklOSS6
	yN9IAYAV40Zf5Vd29m6V0/HXJ2LFOF+oqVKydb7s8Q==
X-Google-Smtp-Source: ABdhPJxBOb6xm/GHT9ZTPPK3e1YYqN0S/yzi1S/Lgd/P6pla6zjMEh846h9p77HB42YHTXmfroTeY7Mni/ehDY4ZC5c=
X-Received: by 2002:ae9:e886:: with SMTP id a128mr11735817qkg.218.1627832175942;
 Sun, 01 Aug 2021 08:36:15 -0700 (PDT)
MIME-Version: 1.0
From: "Jon Mason" <jdmason@kudzu.us>
Date: Sun, 1 Aug 2021 11:36:05 -0400
Message-ID: <CAPoiz9zH=UK1Aj=o6rWVmF4De58hjXyZ4QBpb8N5Lus898x6Uw@mail.gmail.com>
Subject: Build break with patch for "qemuboot, xen-image-minimal: enable runqemu for qemuarm64 Xen images"
To: Christopher Clark <christopher.clark@starlab.io>, Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

I'm building xen-image-minimal for gem5-arm64 machine (in the meta-arm
layer) and the recent patch to add qemuarm64 support is breaking my
builds.  The patch in question is:

19347a7c4e4c qemuboot, xen-image-minimal: enable runqemu for qemuarm64
Xen images

You can see an example of the breakage here:
https://gitlab.com/jonmason00/meta-arm/-/jobs/1468242014

The problematic line is
diff --git a/recipes-extended/images/xen-image-minimal.bb
b/recipes-extended/images/xen-image-minimal.bb
index 6733801cca5f..ca6d26836c42 100644
--- a/recipes-extended/images/xen-image-minimal.bb
+++ b/recipes-extended/images/xen-image-minimal.bb
@@ -31,7 +31,7 @@ XEN_PCIBACK_MODULE_x86-64 = "kernel-module-xen-pciback"

 LICENSE = "MIT"

-inherit core-image
+inherit core-image qemuboot-xen-defaults qemuboot-xen-dtb

Reverting this line "fixes" my problem.  It seems odd to add qemu
stuff for machines that don't need it.  Is it right to add qemu stuff
to an image.bb?


Thanks,
Jon
