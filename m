Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web12.1142.1580582423583721924
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 01 Feb 2020 10:40:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m3cxvo5+;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id r21so11553866edq.0
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 01 Feb 2020 10:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uiXTdJ9CMzs+1xEf1hrfjAYC9oSrdNN0B/2enBsTAj8=;
        b=m3cxvo5+ukiPn1b870Ky1NtUArZa9KJIQifzkX1zU0TiqlDyQbRS5/fyNbP7FJ5/gF
         u04xn7lGCsHQKsL6Nl3s13Tur/PHWle8iV+NZqfF44Z+Ow42VLj+rvOmhnNGIdQPIKvn
         mOFWNBfYE5ajR3kCb7a1khR/t/3nelCx2tPwnYWO3uhfxjuO3JZ9RebANggRmPSEY9Xv
         GOpdoSmYlqLgFH+bUvTR5i156RrQ7imQGAboD46SiAJHjCQcqO8EzrMbfJwcw4N7bfvF
         y9cON/aFkQAhXI0UDYDFRMvyTkqZHYd+4m6bCXf4PsQoKgzsS8ucnK0xk82nhCYLFqZ4
         S4cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uiXTdJ9CMzs+1xEf1hrfjAYC9oSrdNN0B/2enBsTAj8=;
        b=sM54Vf2FcvMBnQyjkONStvS2s9DbOPeMkhGsifSYnFswL5KOqjnTIjnVwiglTU6iLL
         JDxy0tcd5jmdN99DyYb4WpXqIT5c/wK7I4vpNVLZ3inZtNUs8Tk6Ht+C4GrHMdqMPWiW
         d8qOPNLRgv2RosnfDO38+P58GRXM2SZHLkqud3AlT1x0NcKu6lwE1NvyJ1NBr03Whl9X
         cJe7V7WHF6+E3zaDV5E7rZVo6q995ZxQacyZfHnYa6zeiFJ862wHWVSqdYMDhQvhw6cw
         VgdcifZZ9Fm5wqohic1ju3NBcidwMJomLgCKk9JRG9aXPKkU4hiC2ogIH/7VL9z3IXBR
         xkTw==
X-Gm-Message-State: APjAAAWSrTYGGGOdxgWUQwMeyXEwzJndIJmHnHN0vAuex6bE4WPl/4/U
	5bEKQOEFo2MuAl9Q8hUG7h7XYAyrIjl7I+4JwKo=
X-Google-Smtp-Source: APXvYqyB0iLgbfzPyvjFJSulOWiWcNYP4QmVlBnHPpdiHR65hTYsoyFqevElUcjcINruzVWeWs43az/hRh0/+HHOKTw=
X-Received: by 2002:a50:ec1a:: with SMTP id g26mr5691334edr.164.1580582422036;
 Sat, 01 Feb 2020 10:40:22 -0800 (PST)
MIME-Version: 1.0
References: <1580579240-12882-1-git-send-email-liu.ming50@gmail.com> <CANx9H-A7CM_-M=U0ij0ajsqz0RTGfnUH_tG+AEuGF_vVMkKmfg@mail.gmail.com>
In-Reply-To: <CANx9H-A7CM_-M=U0ij0ajsqz0RTGfnUH_tG+AEuGF_vVMkKmfg@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Sat, 1 Feb 2020 13:40:11 -0500
Message-ID: <CADkTA4Pf-F+SVAYzzhrtCeDeCDLUSMetM8-9mwSUP=iY_82Xmg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/2] python3-fastentrypoints: add recipe
To: Tim Orling <ticotimo@gmail.com>
Cc: Ming Liu <liu.ming50@gmail.com>, meta-virtualization@lists.yoctoproject.org, 
	simon.bueler@toradex.com, Stefan Agner <stefan.agner@toradex.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 1, 2020 at 1:32 PM Tim Orling <ticotimo@gmail.com> wrote:
>
> This seems generally useful and should go to meta-python?

With only the one user, I'd prefer to just merge it here. If anyone
else needs it, we can consider it as a move later.

queue my rant about having it where we know we can test it :D

Bruce

>
> On Sat, Feb 1, 2020 at 9:47 AM Ming Liu <liu.ming50@gmail.com> wrote:
>>
>> From: Ming Liu <liu.ming50@gmail.com>
>>
>> python3-fastentrypoints is a python module that make entry_points
>> specified in setup.py load more quickly.
>>
>> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
>> ---
>>  .../python/python3-fastentrypoints_0.12.bb             | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>  create mode 100644 recipes-devtools/python/python3-fastentrypoints_0.12.bb
>>
>> diff --git a/recipes-devtools/python/python3-fastentrypoints_0.12.bb b/recipes-devtools/python/python3-fastentrypoints_0.12.bb
>> new file mode 100644
>> index 0000000..7bd1651
>> --- /dev/null
>> +++ b/recipes-devtools/python/python3-fastentrypoints_0.12.bb
>> @@ -0,0 +1,18 @@
>> +SUMMARY = "Make entry_points specified in setup.py load more quickly"
>> +DESCRIPTION = "Using entry_points in your setup.py makes scripts that start \
>> +really slowly because it imports pkg_resources, which is a horrible \
>> +thing to do if you want your trivial script to execute more or less \
>> +instantly. fastentrypoints aims to fix that bypassing pkg_resources, \
>> +making scripts load a lot faster."
>> +HOMEPAGE = "https://github.com/ninjaaron/fast-entry_points"
>> +SECTION = "devel/python"
>> +
>> +LICENSE = "BSD-2-Clause"
>> +LIC_FILES_CHKSUM = "file://README.rst;md5=f212a0cb34eb678477972d2011fb365a"
>> +
>> +inherit pypi setuptools3
>> +
>> +SRC_URI[md5sum] = "390ad9a9229164a06156a5b1f0ef1b22"
>> +SRC_URI[sha256sum] = "ff284f1469bd65400599807d2c6284d5b251398e6e28811f5f77fd262292410b"
>> +
>> +BBCLASSEXTEND = "native nativesdk"
>> --
>> 2.7.4
>>
>>
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
