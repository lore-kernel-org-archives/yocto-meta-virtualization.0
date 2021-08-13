Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.34109.1628843310951967261
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 13 Aug 2021 01:28:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aFeHgNPp;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: robert.berger.yocto.user@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 203-20020a1c00d40000b02902e6a4e244e4so6380921wma.4
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 13 Aug 2021 01:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=FFc+4XFwOchOuPQCNHZitGWGBCik1c7WqXvGAwS8YIo=;
        b=aFeHgNPpBa4hBBh2RMt59E3FlJ+ICsbvk1lg8gOJDOuE/LFVXnVjFIgLNqZ1XGbCf8
         dqaUZ9eXK53IBkcDVa0s8nIrMpA9JPVr2QhF605Flp4HJMRcb9uoOasTRB+9rjb0JhVK
         aKquffQlZXBYLUDcBg6xg1E+Kw2xdk45D4MNABHtQ8gbb/FKRspHBSHaKeyP6N/oBw5G
         7cQDTPR6z/oiLxJfw8Ympuy9BVjkWrExMk2+RnGz/teAoWt7YTQswCEWEVkocblpSpOT
         cY3F+VsDnre8MUk+DCZ3N1c+qhihPxD7OTAKSNjEaa1VNyeUXEynbZLLR/Il9AKKYsrq
         oobg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FFc+4XFwOchOuPQCNHZitGWGBCik1c7WqXvGAwS8YIo=;
        b=QbDvY9s5yn0zTE9I9WaDSJ3OOTd2ON9xiTVzeO+GEG7R7C1fsRxEgta20MtFkhTQGH
         sVdafUCxTL9Q2BfWcyOMmQAiXDpBt860YhUi1i7lEAmj0y282gBNy22e6tj229ui30Og
         j3em9LE5IgNcqOpve+Zwib5x6sV/7hcbiIi2mxvoU2fdqrn5BWfBf0bgr7gvSGS+T8DH
         aVr+RN18M4vthXlnMPahdHXiKWcTtE+6L0mjQQVFZ1x9AfVYxBnJ9jE8A6hyKzv+YDzs
         2lxqrOadFyco5EOKAJLkSnVIUb3w/JE9clX+c5n+LMV9cvELrvi/TxruDkeTYQHaTkth
         Cv2A==
X-Gm-Message-State: AOAM532guithN/BDQAkbn7ftnvn237C+ce00pwg2Y613dIPhiCtkr3EL
	EhRTUlQGZ3gv7T8v9ix+KDeruN/sPuA=
X-Google-Smtp-Source: ABdhPJzT9DFtTalzp6fAeOR/B0ZUAC+NLZrPjUxhWKLPFAlDV5Xj/MVmKYkl0vDyRyMoXLlyH64Nng==
X-Received: by 2002:a1c:f314:: with SMTP id q20mr1544723wmq.154.1628843309461;
        Fri, 13 Aug 2021 01:28:29 -0700 (PDT)
Return-Path: <robert.berger.yocto.user@gmail.com>
Received: from [192.168.42.52] (ppp-2-86-128-196.home.otenet.gr. [2.86.128.196])
        by smtp.gmail.com with ESMTPSA id a77sm766705wmd.31.2021.08.13.01.28.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Aug 2021 01:28:29 -0700 (PDT)
Subject: Re: [meta-virtualization] Kubernetes & Docker on Xilinx Versal Yocto
To: Ramon Fried <rfried.dev@gmail.com>,
 meta-virtualization@lists.yoctoproject.org
References: <CAGi-RUKss9DvoFr3g3pagbLcAnUCtqWEQXiNaK4PstN+T+hLbw@mail.gmail.com>
From: "Robert Berger" <robert.berger.yocto.user@gmail.com>
Message-ID: <5edc280c-04df-2f8d-e2d9-8837bb1008fc@gmail.com>
Date: Fri, 13 Aug 2021 11:28:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAGi-RUKss9DvoFr3g3pagbLcAnUCtqWEQXiNaK4PstN+T+hLbw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

My comments are inline

On 10/08/2021 18:06, Ramon Fried wrote:
> Hi all,
> I'm working on the bring-up of Kubernetes worker node on Xilinx
> Versal. (ARM A72)
> The storage media (NOR flash) is too small, and I'm running all the
> filesystems as tmpfs, which I load at boot time.
> 
> I'm experiencing a lot of issues bringing up Docker and Kubernetes
> together this way, it seems that running these from tmpfs is not that
> trivial.

I am not sure you can run an overlayfs over a tmpfs - never tried that.

> The overlayfs causes real weird issues where suddenly the proc fs is
> unmounted, symbolic links that stop working, etc.
> 
> Did anyone succeed running Kubernetes with Docker using the overlayfs2 plugin ?
> I saw on the Docker manual, that overlayfs2 only supports ext4, I'm
> wondering if I'm on the right track.

I typically use an SD card (big enough) and dedicate a btrfs partition 
for containers and/or kubernetes.

e.g. /dev/mmcblk0p3 on /var/lib/rancher type btrfs 
(rw,noatime,ssd,space_cache,subvolid=5,subvol=/)

This seems to work fine and as a nice side effect I can use btrfs 
subvolumes for snapshots.

kubernetes writes to a subvolume /var/lib/rancher/k3s and I can do 
snapshots e.g. to /var/lib/rancher/snapshot/k3s/xxx

root@k3s-node-1:/var/lib/rancher# btrfs subvolume list /var/lib/rancher
ID 257 gen 16 top level 5 path k3s
ID 258 gen 22 top level 5 path snapshot
ID 260 gen 21 top level 258 path snapshot/k3s/2021-08-10-11:25:17
ID 261 gen 21 top level 258 path snapshot/k3s/2021-08-10-11:28:00

> 
> Would love to share notes.
> Thanks,
> Ramon.

Regards,

Robert

> 
> 
> 
> 
> 

