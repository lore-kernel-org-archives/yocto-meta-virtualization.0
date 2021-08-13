Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web11.43553.1628893518959370334
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 13 Aug 2021 15:25:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LBpNfPw/;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: rfried.dev@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id e13-20020a9d63cd0000b02904fa42f9d275so13869870otl.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 13 Aug 2021 15:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lgD4vzKn9yxl5b13VD/KWnt6YQ3nscGNOUUo7ztMNcg=;
        b=LBpNfPw/xA04xEkUbrIH2KYPHBKQCBLim04a2zSYn02TAz5jPa9Xz/Acgf/rz9CJko
         L1LGlwMmFO2Jt0KZ8vurrugp9+FMqp7rdXsJdDjplDl/tbqW75vzzW52tT8h+OVUD7sF
         CkfSs4l5D19n5KR+fk8jzLpkjrzuTR4XFeON54a1mWmysnoeqOyD7mS3OfvSzBrnmyqy
         8ofOyStF6ZmqUtPCNrLhxCM4wzsQ/wwQESkE/6sjjClDUtaoD82K8tk0G9fxadl5VuNm
         7hodBtGtLszXwtT89ULWDkqDpgfHOjhbeoQ+MdTJ0rtuDDKjv0dZimJqIYfNKun1PS23
         P0pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lgD4vzKn9yxl5b13VD/KWnt6YQ3nscGNOUUo7ztMNcg=;
        b=V/WfKzqVRywTZUll87d5j+MX2E7e1/XL5INrAPaqZqRAJYqEyeeodRTauPsAg6dTNu
         XhPToPIi7wfSCC5PcXgpO5dnVlJ+r55I7+oC0dAM+Yq4rkzDaPwWUeQhwep8XwQmBkSq
         5DhGkFVnWsB1Ep2YCo0vUdWWju15oyDGpC1AYqroV6HFuchOONDAZ2Z7d/Ci3qn3/mmr
         U3ofRAwYtyaBFlJwRGX0Qu2tvzHPRZ98H5mW9m5lCwsZK1fGrGR18emrwP0fGicpScfl
         A5LJRuDESgS3ENVPBnOCIhv76ysTZn39RtpPKAic/gs8jiev7XQGetAkfvggpFdtcsk9
         DJkg==
X-Gm-Message-State: AOAM533fDPArF450Az6P4WJenKayqq/H1NO8HSEanbw02Usx48ObKVuz
	YuWB+IgWgmgckQHUNOAMoqMv8VVPfFOlMK3VV5g=
X-Google-Smtp-Source: ABdhPJw75c6y0cUdW+HGychQNl9GvXT5WdH9XB2oUs3ZBbKw/QGT+oM1xP0c3waVQWY+mRBNxRMiC8q0cRit/gr40Gw=
X-Received: by 2002:a05:6830:1459:: with SMTP id w25mr3986663otp.370.1628893516925;
 Fri, 13 Aug 2021 15:25:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAGi-RUKss9DvoFr3g3pagbLcAnUCtqWEQXiNaK4PstN+T+hLbw@mail.gmail.com>
 <5edc280c-04df-2f8d-e2d9-8837bb1008fc@gmail.com>
In-Reply-To: <5edc280c-04df-2f8d-e2d9-8837bb1008fc@gmail.com>
From: "Ramon Fried" <rfried.dev@gmail.com>
Date: Sat, 14 Aug 2021 01:25:05 +0300
Message-ID: <CAGi-RUJBYwcWLpAXovRU_66APiih2+zJPvMwNP0wk3J7Wop43Q@mail.gmail.com>
Subject: Re: [meta-virtualization] Kubernetes & Docker on Xilinx Versal Yocto
To: robert.berger.yocto.user@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 13, 2021 at 11:28 AM Robert Berger@yocto.user
<robert.berger.yocto.user@gmail.com> wrote:
>
> Hi,
>
> My comments are inline
>
> On 10/08/2021 18:06, Ramon Fried wrote:
> > Hi all,
> > I'm working on the bring-up of Kubernetes worker node on Xilinx
> > Versal. (ARM A72)
> > The storage media (NOR flash) is too small, and I'm running all the
> > filesystems as tmpfs, which I load at boot time.
> >
> > I'm experiencing a lot of issues bringing up Docker and Kubernetes
> > together this way, it seems that running these from tmpfs is not that
> > trivial.
>
> I am not sure you can run an overlayfs over a tmpfs - never tried that.
>
> > The overlayfs causes real weird issues where suddenly the proc fs is
> > unmounted, symbolic links that stop working, etc.
> >
> > Did anyone succeed running Kubernetes with Docker using the overlayfs2 plugin ?
> > I saw on the Docker manual, that overlayfs2 only supports ext4, I'm
> > wondering if I'm on the right track.
>
> I typically use an SD card (big enough) and dedicate a btrfs partition
> for containers and/or kubernetes.
>
> e.g. /dev/mmcblk0p3 on /var/lib/rancher type btrfs
> (rw,noatime,ssd,space_cache,subvolid=5,subvol=/)
>
> This seems to work fine and as a nice side effect I can use btrfs
> subvolumes for snapshots.
>
> kubernetes writes to a subvolume /var/lib/rancher/k3s and I can do
> snapshots e.g. to /var/lib/rancher/snapshot/k3s/xxx
>
> root@k3s-node-1:/var/lib/rancher# btrfs subvolume list /var/lib/rancher
> ID 257 gen 16 top level 5 path k3s
> ID 258 gen 22 top level 5 path snapshot
> ID 260 gen 21 top level 258 path snapshot/k3s/2021-08-10-11:25:17
> ID 261 gen 21 top level 258 path snapshot/k3s/2021-08-10-11:28:00
>
> >
> > Would love to share notes.
> > Thanks,
> > Ramon.
>
> Regards,
>
> Robert
>
> >
> >
> >
> > 
> >
>
Thanks Robert,
I finally managed to run Kubernetes by setting the storage driver to
"vfs", although Kubernetes complains in pre-flight, it actually works.
