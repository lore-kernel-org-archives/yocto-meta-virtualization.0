Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.4348.1582637826161319689
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 25 Feb 2020 05:37:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YsMhVXl9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id q9so3021410wmj.5
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 25 Feb 2020 05:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=eTlAzVnfE0tvj3EiTr4c9Y/f/ze/2Tt7jphdBO9x9xg=;
        b=YsMhVXl9IpRHlGjVZ8XipJ0ZLL2NYtX1Jftp+9GZcWshSAYd5iF2u9NcOfiPPMJPDB
         SFWa+iW2ikZAVnO4AfD1NXI282sAlZKyPBQtZYbKLTYfEpnTF1hoUOLytxn0qL9b7Mhl
         YQK9VJU9OE3lOE04fvhviCi4q6RADOsy83wZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=eTlAzVnfE0tvj3EiTr4c9Y/f/ze/2Tt7jphdBO9x9xg=;
        b=ZVoJo5OwxYqdyzgY4W8zBteXXnqFzcoygN5pxGw8aT7ASM7M3t2cXVIOlQyxCPA3RK
         GstdIiw0+Ab43bXdvTaSKA/M+OTkMjiK8i42TQmsXw4VWhabuW6mit0wbnG48ZmFfq1i
         fsL9aU/qOejdaoAjo/otWj+CewqObZ6v/JMc12SBt3r5vdZuQqxnATMlQh0gvRru42yw
         TeVTCjstzIA7SGBe7y79vRaaSkq0iq8nQYzl7MuvmbVMwpkw7MgIFAFD4l3SBJM0WenB
         E0UhV8JgXGrALT3h2PuolYkT8YrHHHJ3+nTvnKyYQ5Se7uTFK6Nx0mvykUluLzZwMZUa
         C8WQ==
X-Gm-Message-State: APjAAAVcHJY6VHIbmRM7GWf379fkAmRgqZ9wseLxQ+cac2Krh9gixoqQ
	jCBXQ3tctkkeqBaz87KXkEs9ng==
X-Google-Smtp-Source: APXvYqzRSmBZERSOvBhmPwBkzANHphwUEg7huMQtkkejRkMxFMMR9gWmKcc2sVgDzZ/TZTt5JdQOrQ==
X-Received: by 2002:a7b:cc97:: with SMTP id p23mr5375785wma.89.1582637824639;
        Tue, 25 Feb 2020 05:37:04 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id o27sm6541605wro.27.2020.02.25.05.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 05:37:03 -0800 (PST)
Message-ID: <ae3d8cc2be9723b354a29cebdd8548f7e629254a.camel@linuxfoundation.org>
Subject: Re: [meta-virtualization] [PATCH] linux: add bbappend for generic cases
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Lee Chee Yang
	 <chee.yang.lee@intel.com>
Cc: meta-virtualization@lists.yoctoproject.org
Date: Tue, 25 Feb 2020 13:37:02 +0000
In-Reply-To: <CADkTA4M6PKA4wJ5vrOYis+q7Tvw+xAbQG7TMyim-Xz_+PZywfg@mail.gmail.com>
References: <1582613221-56653-1-git-send-email-chee.yang.lee@intel.com>
	 <CADkTA4M6PKA4wJ5vrOYis+q7Tvw+xAbQG7TMyim-Xz_+PZywfg@mail.gmail.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-02-25 at 08:33 -0500, Bruce Ashfield wrote:
> On Tue, Feb 25, 2020 at 1:47 AM Lee Chee Yang <
> chee.yang.lee@intel.com> wrote:
> > From: Chee Yang Lee <chee.yang.lee@intel.com>
> > 
> > add generic .bbappend for linux kernel recipe to allow
> > all linux kernel recipe with name "linux-%" to enjoy the
> > kernel config from virtualization layer.
> 
> The generic bbappend makes sense, but having them completely
> unversioned is an issue. Having them completely generic gives us no
> way to adjust the names as they change over time (and they do) and
> can
> give the false impression that they've been tested or are valid for
> any version.
> 
> Last I checked, the % wildcard means "until the end", so we can't do
> linux-%_<version>.bbappend
> 
> I've always had the LINUX_VERSION variable in linux-yocto for cases
> like this, so I'm wondering if not only can we check the distro
> feature, but can we also check the version before doing the kernel
> feature addition ?
> 
> I've cc'd Richard, in case he sees this and can offer a suggestion.
> 
> I'll think on this more, since I'd rather collapse all the
> linux-yocto* bbappends, into a single bbappend that works like this,
> so not only can it be used by other kernels, I can actually test it
> :D

There are a few options. You could for example probably do something
like:

include ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', 'linux-yocto-${LINUX_VERSION}_virtualization.inc', '', d)}

(note include instead of require)

Cheers,

Richard

