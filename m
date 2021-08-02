Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web12.15568.1627875948155321577
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 01 Aug 2021 20:45:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RbFt32zJ;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id js7so5740170qvb.4
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 01 Aug 2021 20:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YbTSolc921dQZEWmgc2iTTvolBuDvMc8QbZ+YbGWvT4=;
        b=RbFt32zJDJPhEI1dUw6GN0GrwT3FiFUNV0MFNCRqPMZVqmWgP7TL4fuZKuvqyBuOhZ
         +THTQ3oSRUEv9XV0ZikBu8sVx+BDtNdu2ry0R95m+FljClewyStKh7BL3vuDfEaCAJ00
         jaomkIF5qtRfe3pqPtsRw8OWE+VY5tW8EwYbz50PwLXOaebN+dFu4mTIuU7nsAmJBrj4
         i5F3noUbVhtfhKQ9jVFWWX017CU+p1jFSd0zw8bPdi7f1x6TtZodAz0L1c0OvBWxlxFt
         Ocn1yROUmtjaeCAZFK7V33s5QSowJQakq5LuS3IYUI2MEFWdQQ1kToWYeCHPkuZZGWo4
         ataQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YbTSolc921dQZEWmgc2iTTvolBuDvMc8QbZ+YbGWvT4=;
        b=Q57WqliffzxFB0btKNRNdoWvl3xVKZAPUMDh1U0LKEaN84VvOt9PeE1V/DD9hGAec/
         g6ruNOMmnmWxTL0HObl4n2FJbDGkn9S6RJpDtdYx4c09sOSOWbNS86l7yLaI6S/FhitT
         czG/RZ9JOk1APgXE5YvEtm+FixijptUuxO8UDsubqDsxYMa/nkkzLgEJJYf1ZRCSuknE
         OfoUrztb76UyYZTXVZplOavyRmB2xAiLdP1f3xDKQpbPt+7FrIEUxIQnN0yByoyyIIJG
         4E0bzU/q3M1gXi8Z0Yvdy4WkJrW/qQSA8XZNjf0u6sMM7TtWNmTPkBIa5wHRmh6epAYS
         xOQA==
X-Gm-Message-State: AOAM531snD0uauTdMXdv9Y0NskOPSdQJnzewA+XOdPou5ltGs9M54pCu
	eWnqUNrodLlJWbWWxe1+75o=
X-Google-Smtp-Source: ABdhPJxvILWTKDiDIZdzNXUo3erKNZypv3mOzOng9tmKnFar+3R0ptn41ihPkZH9d7zZ4zh290RlxQ==
X-Received: by 2002:a0c:fd48:: with SMTP id j8mr14720708qvs.60.1627875947407;
        Sun, 01 Aug 2021 20:45:47 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id a21sm5208007qkk.74.2021.08.01.20.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 20:45:47 -0700 (PDT)
Date: Sun, 1 Aug 2021 23:45:45 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: "Ruslan Babayev (fib)" <fib@cisco.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization][PATCH v3] python3: remove the no-longer required bbappend
Message-ID: <20210802034542.GA16820@gmail.com>
References: <20210726185823.26402-1-fib@cisco.com>
 <20210726185823.26402-2-fib@cisco.com>
 <20210729145700.GB40673@gmail.com>
 <SJ0PR11MB4784457572877D025E5E69F5ADED9@SJ0PR11MB4784.namprd11.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <SJ0PR11MB4784457572877D025E5E69F5ADED9@SJ0PR11MB4784.namprd11.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In message: RE: [meta-virtualization][PATCH v3] python3: remove the no-longer required bbappend
on 31/07/2021 Ruslan Babayev (fib) wrote:

> Can this be cherry-picked into dunfell please?

No problem.

It is now on dunfell as well.

Bruce

> 
> -----Original Message-----
> From: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists.yoctoproject.org> On Behalf Of Bruce Ashfield
> Sent: Thursday, July 29, 2021 7:57 AM
> To: Ruslan Babayev (fib) <fib@cisco.com>
> Cc: meta-virtualization@lists.yoctoproject.org
> Subject: Re: [meta-virtualization][PATCH v3] python3: remove the no-longer required bbappend
> 
> merged.
> 
> Bruce
> 
> In message: [meta-virtualization][PATCH v3] python3: remove the no-longer required bbappend on 26/07/2021 Ruslan Babayev wrote:
> 
> > It has been carried over from python2 and is no longer required.  More 
> > importantly it breaks the python3-native build due to 
> > ${STAGING_DIR_TARGET} being "" for native recipes.
> > 
> > Signed-off-by: Ruslan Babayev <fib@cisco.com>
> > ---
> >  recipes-devtools/python/python3_3.%.bbappend       | 1 -
> >  recipes-devtools/python/python3_virtualization.inc | 8 --------
> >  2 files changed, 9 deletions(-)
> >  delete mode 100644 recipes-devtools/python/python3_3.%.bbappend
> >  delete mode 100644 recipes-devtools/python/python3_virtualization.inc
> > 
> > diff --git a/recipes-devtools/python/python3_3.%.bbappend 
> > b/recipes-devtools/python/python3_3.%.bbappend
> > deleted file mode 100644
> > index 617cacc..0000000
> > --- a/recipes-devtools/python/python3_3.%.bbappend
> > +++ /dev/null
> > @@ -1 +0,0 @@
> > -require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', 
> > '${BPN}_virtualization.inc', '', d)} diff --git 
> > a/recipes-devtools/python/python3_virtualization.inc 
> > b/recipes-devtools/python/python3_virtualization.inc
> > deleted file mode 100644
> > index 55301c7..0000000
> > --- a/recipes-devtools/python/python3_virtualization.inc
> > +++ /dev/null
> > @@ -1,8 +0,0 @@
> > -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> > -
> > -DEPENDS += " ncurses"
> > -
> > -do_compile_prepend() {
> > -	export LIBRARY_PATH=${STAGING_DIR_TARGET}/lib
> > -}
> > -
> > --
> > 2.26.2.Cisco
> > 
