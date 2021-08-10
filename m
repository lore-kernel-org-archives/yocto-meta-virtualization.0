Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web09.1667.1628608029328623065
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Aug 2021 08:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CTxP5vcC;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: rfried.dev@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id s13so19935841oie.10
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Aug 2021 08:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=iqGCzx2fqdKud3U8u9Kyk76Qgx6PnjCcFU6yEcfiKzE=;
        b=CTxP5vcCZMgeWhzsnF2RqEaU2SVw74QnyhTYP1H+vXnOcN5kumV1Xu4pXydU2DB3UJ
         Z2jd6rc16R0G+MC1M33nT9UOMVIny+gnAlphxhJ9OaPhC6cRZAZI8sJ9OpYqGBKq/IfU
         4uqlWipDg7982cQ30Va5Kt4qJZ/YG1bXrSpceCnbPuKdaGbvNDLFetyALePJl39cM8Zj
         DO2zJNDby/kkfU3EgoZReWuZQ5Wfm2qb+lcAs91TKd3gkmO6YFzgfeHIAuj+6h7Mt00u
         RYGCWRhA9Gq0M1GG46YNyU9jitihmpX5IPvfVTzpqXocjfw3oyBhGqFy97i0PYQViDu6
         W67w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=iqGCzx2fqdKud3U8u9Kyk76Qgx6PnjCcFU6yEcfiKzE=;
        b=PH134TH4tgHAp5NBMQBgIyLK2Mk/6710xNuxM+gJs+M9PCtpcvFSrLQDQvgN+n2Rw9
         TR67VNRA1oNeDgEsjaHbXwJfwz7LkjJL1Ony8/YrNv6eXskpBPSQwh/9emA21021VRYA
         WQJ7vx6YnxSjfbD/c02bPh6UeOAQkneq/znFmjvQUap6QmroLCY+kfduj4u1TAyOyE2I
         DObZsUabpX69J7zyUABFBo0qJW+GxhaPYyOrM2WH0crlkPVeIVgHDUownre3aqnUCqt0
         uwzEOGLnHBgHBX8BY593aCB352nMMTgOmciRggBXQ6HSi4IbmqkkqdEIJj0qupiu4g8l
         RlBw==
X-Gm-Message-State: AOAM531eN1S9zRq5Ga4mSuDKveGgV3lkWyyY1ScbeKD+0gEKYokIZg4d
	vYvcpH8fRNFGxnq9tlOvmhGlSpGABaR+6EeU1qTd3TNUBG0=
X-Google-Smtp-Source: ABdhPJw6MsNxJxQ11/YhRTGnUrZDKgqlh1UY6G8Yvs29wR8oE51Kwda8/uN8IFsyC71U4ru/VvAD54AYL1JxkbxHWvg=
X-Received: by 2002:a05:6808:f04:: with SMTP id m4mr3957574oiw.92.1628608028019;
 Tue, 10 Aug 2021 08:07:08 -0700 (PDT)
MIME-Version: 1.0
From: "Ramon Fried" <rfried.dev@gmail.com>
Date: Tue, 10 Aug 2021 18:06:56 +0300
Message-ID: <CAGi-RUKss9DvoFr3g3pagbLcAnUCtqWEQXiNaK4PstN+T+hLbw@mail.gmail.com>
Subject: Kubernetes & Docker on Xilinx Versal Yocto
To: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Hi all,
I'm working on the bring-up of Kubernetes worker node on Xilinx
Versal. (ARM A72)
The storage media (NOR flash) is too small, and I'm running all the
filesystems as tmpfs, which I load at boot time.

I'm experiencing a lot of issues bringing up Docker and Kubernetes
together this way, it seems that running these from tmpfs is not that
trivial.
The overlayfs causes real weird issues where suddenly the proc fs is
unmounted, symbolic links that stop working, etc.

Did anyone succeed running Kubernetes with Docker using the overlayfs2 plugin ?
I saw on the Docker manual, that overlayfs2 only supports ext4, I'm
wondering if I'm on the right track.

Would love to share notes.
Thanks,
Ramon.
