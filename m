Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.9972.1612876974957760867
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Feb 2021 05:22:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l0pVdqnT;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id a19so17884381qka.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Feb 2021 05:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Rk7a9DR3V9GA6mQJpnQQQkl9RrzPIybLw661PMdlz1g=;
        b=l0pVdqnTQNyqKbWfHa2leYGyBMwSvOZXbnuTYvWAhHlrG+FEDmcFJRLokKKk13/yKc
         Hgbi1qW4mAjXOOaLB4rM+VXbL5pnuJCvN51lL0SvgG5+z+lJD58+aYHtyZaa5O2c51cf
         6CqnORli1xy5ksg/8589H6wSwK1oXPR94kYUJE4782EfJbT9YRb1P6cQs5JxuZUaVLjJ
         nRxvCXOK6IYvavM3PlihvgQw7+ynjdI3ETR7v0ZHZAO3s5DUXSsHKTAlumPSYoTAosqC
         MMANL9GP51zg2OnM6Iq+54b6eKNp8HVv7b9LgM1kgyxJKLop1F6HKQzaglrsrSPyNTIw
         gZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Rk7a9DR3V9GA6mQJpnQQQkl9RrzPIybLw661PMdlz1g=;
        b=datAI/do7wAHzcYht8jzpjGI9ebPmXMf1zhMPUdOoFsygF/GttwkThVH2yc3vOaHbY
         RQ3omY9aI94DW3stPokuV5gucg7jLCIcHVlbOjSDbtYL3HAh8bUtXmeKmYJR+UamavZH
         TjoDQf2tmU4bX8OzJWu0rTRlDYb5j2EfJ9py/NYZJADPx9QKyNVKYPQPHtntqaNe7Uyr
         QJURG9rv956vVXp5gtNKxj9/TTQIxvgiRuztouu92ncnsyrJXcSiWJpidVM3gQ2uPihs
         DhNj1wUU4QJ4y/oFS18eJytnt2p8qwzVf4Hk1u6b/gHre/+orsAvGzTu26qGo//I6ih4
         PNRw==
X-Gm-Message-State: AOAM530pMg+uNRNAc6eNGQYZONwGx8Iu5BH4nBZyoCSlp8/A5KGfl3bf
	j2p27MUlDxnk8A1d9s1BOPM=
X-Google-Smtp-Source: ABdhPJzOW0YnVfm5WMOjM/5neHyjpstZsHv0y0uJ12lGY54RFGLKoRq+ejYFSUgL6pnOm1fbaztm5w==
X-Received: by 2002:a37:aa4e:: with SMTP id t75mr21046495qke.343.1612876973995;
        Tue, 09 Feb 2021 05:22:53 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id v1sm2766433qki.49.2021.02.09.05.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 05:22:53 -0800 (PST)
Date: Tue, 9 Feb 2021 08:22:51 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH 2/2] libvirt-python: inherit python3targetconfig
Message-ID: <20210209132248.GA44698@gmail.com>
References: <20210209080915.1149076-1-Martin.Jansa@gmail.com>
 <166205F40D747E18.19464@lists.yoctoproject.org>
 <CA+chaQemgaG1DHNN+jyV_NaBCGNXivoCK-En73H+NbAYPqbbgw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQemgaG1DHNN+jyV_NaBCGNXivoCK-En73H+NbAYPqbbgw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

In message: Re: [meta-virtualization][PATCH 2/2] libvirt-python: inherit python3targetconfig
on 09/02/2021 Martin Jansa wrote:

> This 2nd one should be merged to dunfell and gatesgarth branches as well when
> the PYTHON_SYSCONFIGDATA_NAME changes are backported there as discussed in:
> https://lists.openembedded.org/g/openembedded-core/message/146715
> https://lists.openembedded.org/g/openembedded-core/message/147844

I've merged both to master.

> 
> Unfortunately it cannot be applied in advance,
> because python3targetconfig.bbclass doesn't exist in oe-core/dunfell nor
> gatesgarth yet, so oe-core and meta-virtualization stable branches should be
> updated at the same time.

I'll keep this around as a reminder that there's a pending backport
and will watch for Steve's dunfell pull requests to do the merge
here.

Bruce

> 
> Regards,
> 
> On Tue, Feb 9, 2021 at 9:09 AM Martin Jansa via lists.yoctoproject.org
> <Martin.Jansa=gmail.com@lists.yoctoproject.org> wrote:
> 
>     * otherwise libvirt build will incorrectly use host's gcc and fail with:
>       gcc: error: unrecognized command line option "-fmacro-prefix-map=/OE/
>     libvirt/6.1.0-r0=/usr/src/debug/libvirt/6.1.0-r0"
> 
>     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>     ---
>      recipes-extended/libvirt/libvirt-python.inc | 2 +-
>      1 file changed, 1 insertion(+), 1 deletion(-)
> 
>     diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended
>     /libvirt/libvirt-python.inc
>     index 7b87d5e..bcd7657 100644
>     --- a/recipes-extended/libvirt/libvirt-python.inc
>     +++ b/recipes-extended/libvirt/libvirt-python.inc
>     @@ -1,4 +1,4 @@
>     -inherit python3native python3-dir
>     +inherit python3native python3-dir python3targetconfig
> 
>      export STAGING_INCDIR
>      export STAGING_LIBDIR
>     --
>     2.27.0
> 
> 
> 
> 
> 

> 
> 
> 

