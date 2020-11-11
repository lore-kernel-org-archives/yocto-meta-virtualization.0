Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.6863.1605102790767250813
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 11 Nov 2020 05:53:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZrxE3sAl;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 9E83C38C04AD
	for <meta-virtualization@yoctoproject.org>; Wed, 11 Nov 2020 13:53:09 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id q3so2338328edr.12
        for <meta-virtualization@yoctoproject.org>; Wed, 11 Nov 2020 05:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=NJ2XWP8mTO2xHYI3IWjYYbID0WZP3FDnZQXBY7WNWgg=;
        b=ZrxE3sAlCfpExjYPQgcLBifIpTPQe8CV3av2W8pPrgF+So9gdXrJv17Q+cOZxjot2d
         99af8Jre3YYQe0pDBeT5yNr17VEdvFnBBt6YgMZHfybmiTBUDmISmVWTnm8vHJQT2/qE
         Ahu0SKDghWfHhVOvwJALITDKzGw1FtWXS9/r7jsxI+3sR0vZ1IcP+XmcKJw+d30NEqLl
         bYqvWI43zo0Ij7a+OTfN/2wIEVTforh56jHlGTn5sn2j4Uo/QIns9aonnhJ+Bs4/POT3
         l8tvi6wheF3rWhfdK3EvqGm2V/Rd3/9NIHsSJEbplzxDOfs5JjdfNeat1Y02/jtO4mTo
         KS9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=NJ2XWP8mTO2xHYI3IWjYYbID0WZP3FDnZQXBY7WNWgg=;
        b=DJGkQjF5l55OqDFk3H/2Wi16ylGHzBlMjZST1pgl4I8VRw5nYJDHDJpXyX4z3FZV6t
         yiek0zEr/N3oD2cOHpMD5IML92QrtDALUV4cmwDM2VZazuYyvWPuvAFItl3D7Biayc0P
         GtzGSDsTq5e7pbNGtYCeTEkJ/KpqaIVTF8Klr3oyu6d9YQrLMz7cf9exq6Ee+234MCPe
         to0ArBsQ0OVP3okTK+hwvWWbdTxS4kh1zGalGNqMotW6mD7ZG3VI0k8TPRQ7uDntJ1l5
         C8ZO9y65jh8t116bOiqeXXq58hpAGLL0xP+drwnp+WowhczlUHe9W3Hv7Mg9XvzCg2D/
         Ii9Q==
X-Gm-Message-State: AOAM533AVCGpGJniwF/WczWT1D9lcV67xbuooT7FN/S/4PhpG/luhRau
	GTu6572ThiWXrCAoKI2P4ZlRX6UfDITzwB+dcJ0HJb5hHLSbNw==
X-Google-Smtp-Source: ABdhPJz0kLv8SheA75JbP1Djz7hFVl6WEgxBiUzwNCyK7EPJwkDkcVkE1/p30BV4b3r05nzXD1cXgAi3nqOTgHMXauE=
X-Received: by 2002:aa7:c886:: with SMTP id p6mr14161068eds.352.1605102787925;
 Wed, 11 Nov 2020 05:53:07 -0800 (PST)
MIME-Version: 1.0
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 11 Nov 2020 08:52:57 -0500
Message-ID: <CADkTA4On0R769cvDqmZ1NPHfLr2gcniNt1CfpJ=ZRMAqEF60cw@mail.gmail.com>
Subject: FYI: branching for Gatesgarth
To: meta-virtualization <meta-virtualization@yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

Hi all,

I had hoped to finish some k3s work before branching gatesgarth in meta-virt.

That effort is dragging on a bit, so I'm doing some final sanity
builds now. If I'm not happen with k3s in the next couple of days,
I'll branch without it.

So either way, by the end of week, there will be a branch in the repo
.. in case anyone cares, or was waiting for it!

Cheers,

Bruce

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
