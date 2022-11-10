Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04927C4332F
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 21:42:51 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web11.1732.1668116562099300923
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 10 Nov 2022 13:42:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UklE4ZRK;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id n191so2318239iod.13
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 10 Nov 2022 13:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2+/pJtPLJRw2ApFK7koDUB6a6MLBhgYm9XbDshLCIeo=;
        b=UklE4ZRKhcWKo9s7s4qYU9/BXUMtQsuhRRrMLI9bM9Kx2BJKsS0wiBBhkczU/9mhlW
         4n68irz+TAsxDVXoaLwkO/MNlHdQyxPdDP1/gqGFPGBl9GKzkG/wFKf5oqPbZpfHxPOq
         4Wcj306GEk2cFQtUlFJ+Bv5qvQ/mP4aQ5PtMsFu81/Chk0QRENzS/AWYGfwd7wItnQO0
         oTy4+rhQnZYsu9c4GEkHGoiwYKjQ9DMVrdXvXJzPTLiVkYFe6EHubpGmh8F7WSzaM54k
         laEX+jOkTAUmqGR+6JMKUONqt/882bc6F2x0gQK0hJVP9QEIBV/sVJsABAkRgS1Q9o1g
         kL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2+/pJtPLJRw2ApFK7koDUB6a6MLBhgYm9XbDshLCIeo=;
        b=5ZlPboMtBFhPOw+oQegN/+kZ/Kp1n0m/zSMg3bwt1nEJG8Lt4jTRPLM7tFCZvCUM+I
         R1t3vu1q5rnRfY5Q5yhpHkw1e32CTJpFcDJvT6xCcPUfSaMRO8o8ereTINr4XDHPK/U7
         UvkVitrVFhtSK2fo3ERYUUVP4CJH5P7ivoJjlBS7qQ2U2dAHj0/uzEb1+iqKqeSrui0q
         n461SU8g5OYEIKgj1ILNttRRfkzd4VLFS6jkZWe//cvSDKuepFVnNm7qMzy7Y38nvfsf
         cR/CidfIieNZ5GdhXGxWw0mRa76NLkBdk4S8wAp50szgZtKopSR5lZcoso1qy5ECHD5i
         /XFQ==
X-Gm-Message-State: ACrzQf0Xq5CZE6z6lN9pUMUKc5mqNHxvpgUBb6yZo40lr2k1xcG9Ip2M
	kfkI5AbQY+KDiBKUVr9oi1xhaiy9mvKQhxazHpA=
X-Google-Smtp-Source: AMsMyM5ViZyU3x02iInmXjOetbsF0/MGP9iD9Iuxl+kj/zZd2FSN4Z55A+/uIEJaczYJAk6aL3fumEF6uXExV+0jELs=
X-Received: by 2002:a5e:8b09:0:b0:6bc:711:821 with SMTP id g9-20020a5e8b09000000b006bc07110821mr3583732iok.192.1668116561200;
 Thu, 10 Nov 2022 13:42:41 -0800 (PST)
MIME-Version: 1.0
References: <5ea5178b-7229-72cf-9fa8-d7fccc83ee51@calgera.com>
In-Reply-To: <5ea5178b-7229-72cf-9fa8-d7fccc83ee51@calgera.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 10 Nov 2022 16:42:30 -0500
Message-ID: <CADkTA4Op1EC-U7VmAp7uaEt0v4_GvBkwTYnxM-RqR-AUuBw+Gw@mail.gmail.com>
Subject: Re: [meta-virtualization] packagegroups and unnecessary builds/fetches
To: ml@calgera.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 10 Nov 2022 21:42:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7681

On Thu, Nov 10, 2022 at 2:25 PM Renato Caldas via
lists.yoctoproject.org <ml=calgera.com@lists.yoctoproject.org> wrote:
>
> Hello,
>
> I'm adding "packagegroup-k8s-host" to my image, and noticed the "k3s"
> package also being built.
>
> Investigating further, it seems that by bundling kubernetes and k3s in
> the same .bb file causes both packages to be built. The same probably
> applies to the "packagegroups" in packagegroup-container.bb, all get built.
>
> In both cases, the norm I guess is for people to just want one of the
> alternatives (kubernetes vs k3s; lxc vs podman vs docker).
>
> Would it make sense to split the packagegroups into individual recipes?
> I'd be happy to submit a patch.

The grouping is intentional, and yes, so is the extra building. The
individual package groups in that .bb are just packages, and when you
bitbake a recipe, all of the packages are built whether they are
installed or not.

That packagegroup has primarily been used to drive the build testing
and package repository construction steps of sanity testing.

They could be split more, but at that point, we aren't much ahead of
just the individual recipes with their inherent depends/rdepends.

I have some pending work to split things up more in the container
definitions cri, cni, etc, etc, but I haven't had enough time to
complete that yet.

Bruce

>
> Cheers,
>    Renato
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7680): https://lists.yoctoproject.org/g/meta-virtualization/message/7680
> Mute This Topic: https://lists.yoctoproject.org/mt/94943666/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

