Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.30644.1623680659005617864
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 14 Jun 2021 07:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ato5KPjR;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id s15so5845817edt.13
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Jun 2021 07:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m0w0IfbU3Cx8nuUcy+mVZvoqocZ7SaO2BGmWFGnC2DI=;
        b=Ato5KPjRRb6ZshHm1XmMxG+2KxpVGSHD4EU1CrOQrIm67nxvloNEfWTdmkree0J4NJ
         fMul5VITIfsXbe0zlNt+1YTVTUghYQYS4nJMRgmcg2TCYN3KjYCYrp3n8KTlKXJkCaYs
         cuTF8H6nrfIt7G/IU7eZyQ+ZFB/QPl3IkPsLxqM79ruizZLmwVvstYEL64r51uqXQXIO
         43OeICYfmqXwQ6n5HJXyHo4z9loxVDwFa5Gq3N3/6sr+5YzAFnrgbGWcQnkUp/5KnmMp
         NtQnXW6YmP0BYYyXnKoJCtakB68+7mXwnzUgybJnA61rLTCyaI3YUi6ELV1Z2bew92dZ
         738w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m0w0IfbU3Cx8nuUcy+mVZvoqocZ7SaO2BGmWFGnC2DI=;
        b=Mn79gZkVUYGIL7LdX+u6hCLyinAXzBT/CFRKZyTMsq+9oQ/mFyKmRkHaHTSyBt6AaN
         tTfUxbHae+uv0lCyEgp2TdxtJ5XXq4JGVkZekV+VqkH66xm3WwR6CvKW60W5iowWVp+2
         wyENZdJUpAsYu3ZRAtvudCJi9it03q2vo+cPvnyjru3LMQK4+SPPbWiMOGszHVv10u+A
         8vufnjzt4f4Qggr96G59W3onSZE/VXPCGjJ4in1N1oRQtjlrHIQ/XfciSZv8J9VcJVxQ
         DJLljBp5MW7CA5fBGNAJwZH7Sf4yCkdUsKHxsOOeXFauoksPr/5aAbLArsueibjriKFj
         6DAQ==
X-Gm-Message-State: AOAM531FlCWm3ye3bCgdzF1dFM7jT8Xheu46e16Kr/zsXuD/2FdYz8Uc
	4ySaBMYldwn2sFBKeHDdWbinpQFKU8CInH8SdhA=
X-Google-Smtp-Source: ABdhPJzc20hqOz+j9Kj+/Z2BIemPzIFjaIZEWyjcx4xz6ozxoOyG6+6HLlphCFCAusWfAfGhd3CBbrXzh21PnBwpeTU=
X-Received: by 2002:a05:6402:cb5:: with SMTP id cn21mr17195275edb.164.1623680657465;
 Mon, 14 Jun 2021 07:24:17 -0700 (PDT)
MIME-Version: 1.0
References: <qTwn.1623666439663990628.RPs0@lists.yoctoproject.org>
In-Reply-To: <qTwn.1623666439663990628.RPs0@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 14 Jun 2021 10:24:06 -0400
Message-ID: <CADkTA4PkCG-xJ+hRANh4_tQFRdBGHrvsqkj=_Y_SPyK=Ru-fDg@mail.gmail.com>
Subject: Re: [meta-virtualization] Networking issue with l3s when using systemd
To: Matt Spencer <matt.spencer@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 14, 2021 at 6:27 AM Matt Spencer <matt.spencer@arm.com> wrote:
>
> Hi all
>
> There seems to be a networking problem with k3s when using systemd.  The problem manifests in that none of the kube-system management containers are able to communicate with eachother.
>
> The root cause seems to be that systemd-networking is actively managing veth interfaces created by k3s/flannel.  This happens because of '/lib/systemd/network/80-wired.network' added by the systemd recipe, which is matching on Type=ether.
>
> My fix is to modify the 80-wired.network to add 'Name=eth*'.  With this in place, k3s works as expected.
>
> I am not sure what the correct upstream solution should be for Yocto?  Your help would be appreciated.
>

This particular issue is known, in the sense that we have run into it before.

At a minimum, I need to warn about it in the k3s README files.

I created the cni bbclass to manage potentially conflicting networking
configs on that front, but systemd-networking is yet another variable.

We don't want to globally make it conflict, since someone might have a
working networkd config that they want to use, and exactly how
networking is set up, tends to be more of a distro feature. So the
recipes need to tread carefully.

Which takes me back to the README, and an enhancement to the
cni-networking bbclass to be more generic and pick up / warn on
configuration issues like this.

bruce


> /Matt
> 
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
