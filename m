Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2739.1792710603940220717
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 22 Oct 2026 16:10:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=k5yfIUXj;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5364042eecfso3213611cf.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Oct 2026 16:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792710603; x=1793315403; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JfR3QlIIrrxhuJdOT/XjQitylF/wqNnhl6cFAYB+Dx8=;
        b=k5yfIUXj7l4I7RZhYT7kADrAMbuatO5S3QVGo3OqyDLPsnfFpcPr4RY8SL9Xgfg8DU
         5LcP6LbsjYOGhjMYhY+L6qmtsg2QWwoea3IrCYnShm1edM39ZX+GZCXvQGXLctS7/ffN
         LBHlcN6RfHyImWDJyZfy4m9N/EsJBij05vWo0FJGJ/F1gqszjNG5PgCMv7l5Pvg1xXZW
         SOZ5DuEwoVO5I7h/KKSYtpLOWqncu63hq88S6e5lS+3qBA7U+KqRFzvdG+Y0/QueL3DS
         G5b3vg0COII9MWpYDv+pRxjkT7EEmQW56ojJQYEYIkyIr7raiI9j+Bi/QiVby85ykXP+
         82xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792710603; x=1793315403;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JfR3QlIIrrxhuJdOT/XjQitylF/wqNnhl6cFAYB+Dx8=;
        b=cO+7+FqBk0vDiSIlwiKkVY7WJqdsVEPd+pARDMPP652UWftDlSw0W/2n/7ZYmP94j0
         AJ4O5SnK+hsS2ds1ezPhmElvKApfn5coKm2IpSjetv9DLV7tEHx1LNxzMQ1i3hn/PNtd
         o32x2AiW4ciekH3B1iZIlpcyGUXaTRuZ+ThHlNq49IqlcmopsOFVTxwXb7AGIJuCRSIv
         gOQ63WgTXzJYfq+ZOX4TJ0hSHtegt2QqJYvHi9375+VkquZHL8RuYKBdmAO/URbikRKL
         EYPnmz1au+FiRkoxmn+R+BlBF0dpSZFBC38i09r1vgBKuwzNIoEdU8wWKF9vNC2oUaOv
         F1Yw==
X-Gm-Message-State: AFq9FYIh74cE/JZ/Aw8DjyccmF9Aaj2yiZOpYNbv1Aidn9XHRyaSIPq9
	6f00sDUzJmI8TxEdaa6s6UfiLD46HQT2ifAES5DrrF8VhG6egNBk5E0WcHYczw+i
X-Gm-Gg: AYBFou15+s7sukgJrFs0bnBLyxsszMXn7hwc38BLlrgamkDb0b1pOPgqRYDOh6mCRXC
	qFKSMSDfB2Nw6kOpUdL8SJuuhcNa0GcDzLHwF4qnnLqvKjcBPJSuTLdVLCP9vEZNh4A3u8mV+jo
	b0p8GyQeSHY8PkbfekY7//vVzgUY4lGLYmLCwD25TEbOlfIx5SGNROZ1IGI96MaUFRCprQwRDbt
	wIvyx3NfP8FHafj2EPpRdpGdOM2giQNb2s1Bqjt6jriyZz8yaKb7HiqT+6zqZOsRm8EjaINp6sf
	KE3KMMBe0nvUdH2PPG0HzDYYwlVvaIimm6CHGdo98wPwsWPL6dDGmuLFbLzKyrhICBjgTyOiqEY
	ccp7JpyKw74bT/Kx7zou0WSGqm4RCyoTZCi5te/B2y7sljhtLRxXvUM5tGu3xD5l07QZ12iHtc7
	5WBgzCwIfdQ4vqnuALVuAyeecQdedGoQ9OXWA6IgF9cC1qfXaEUyWh0tHbIPzFk2qWjzdChv+e9
	wh6MERvfgVMYrxUK/Y6ShA9/laQex+o0C3haVmLvcMKQzS7WYcj41h/40sWho0EX6A1vqfzD8vQ
	OMkFiTWPv8DofRrDSG+OJzm8YZtjeimT+HEvqLAN1rpaMB3LNXL5Js+jfVsnxpzO6SJ+sTaGvwN
	bjIDTEJlvsuJD4RDTLU8F8vjHni4ytjN/BoPUogilvmGL1vdUG0A5
X-Received: by 2002:ac8:5f4a:0:b0:536:5e48:745 with SMTP id d75a77b69052e-536c2590f38mr6623281cf.43.1792710602605;
        Thu, 22 Oct 2026 16:10:02 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from [127.0.1.1] (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-536c167daacsm4405681cf.1.2026.10.22.16.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 16:10:01 -0700 (PDT)
Message-ID: <6ada97c9.cb15bf0c.c1fef.de2b@mx.google.com>
Date: Thu, 22 Oct 2026 16:10:01 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: thomas.perrot@bootlin.com
Subject: Re: [meta-virtualization][PATCH] fuse-overlayfs-snapshotter: add recipe
In-Reply-To: <20261005113630.1669431-1-thomas.perrot@bootlin.com>
References: <20261005113630.1669431-1-thomas.perrot@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Oct 2026 23:10:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10136

Hi Thomas,

Reviewed the patch and it looks really good. I appreciate it
following the layer conventions with the go-mod-vcs hybrid layout
and the associated generated files.

One thing to resolve before I take it: the hardcoded /mnt/data
reference in two places.

  files/containerd-fuse-overlayfs.service:
    ExecStart=/usr/bin/containerd-fuse-overlayfs-grpc \
        /run/containerd-fuse-overlayfs/containerd-fuse-overlayfs.sock \
        /mnt/data/containerd-fuse-overlayfs

  fuse-overlayfs-snapshotter_git.bb do_install:
    echo "d /mnt/data/containerd-fuse-overlayfs 0700 root root - -" \
        > ${D}${sysconfdir}/tmpfiles.d/containerd-fuse-overlayfs.conf

/mnt/data isn't a path that will exist on a stock meta-virt image.
Was that intentional for your project (data partition mount
convention, etc.), or a holdover from a local test setup? FHS-normal
for a daemon's persistent store would be /var/lib/containerd-fuse-
overlayfs/ -- which also matches what the upstream project README
suggests when running out-of-box.

If /mnt/data is specific to your deployment and you need it, the
usual pattern in meta-virt is a recipe variable with a sane default:

    CONTAINERD_FUSE_OVERLAYFS_ROOT ?= "/var/lib/containerd-fuse-overlayfs"

referenced from both the service file (via a substitution during
do_install) and the tmpfiles.d entry. Downstreams that need /mnt/data
override the variable in their local.conf without carrying a bbappend.

A v2 switching the default to /var/lib/containerd-fuse-overlayfs and
(optionally) parameterizing via the above variable would be the
smallest change to get it into the tree. I'm happy to do the
amend on apply if you'd prefer to not spin another patch -- let me
know which you'd rather.

Cheers,

Bruce
