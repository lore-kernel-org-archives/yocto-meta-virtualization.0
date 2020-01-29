Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web09.6747.1580312592598272344
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 29 Jan 2020 07:43:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TQAmDmzj;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id v28so140588edw.12
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 29 Jan 2020 07:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5cR9fTn0Ci4vQt6QkvDxQidJSyqbMLzXLZOoPpJ/Eqc=;
        b=TQAmDmzjoZHX5RbEbl+Wk+nBjkYJKy8+H6HilLcldb+YJzEicCj6Ycj9Ynv+bLrmv7
         VTQUk1bl/COQtI6tPQiCT3+5Fs78xEU5HH5Q9W7nEtDpx+k03Wzk/usZf5udhQePc6Qu
         nQdPR6WnLjBkx+OqVjopXSmmZIscI2Q2yZYgst9cEQ2gcKhe8deu8bKMk61GSSFVxlZg
         XvsEQYY177X4ypolHdqmQq+Tz4rzWe5CGlsZu9u8ZTG4UkxX5zAiekdsqkV9H6vpIPLw
         cFgNeukylxTcwontbfwKM3xHr7wm9Kt2Vq8QJILWcH37wOjXoQOk4piYxwwvaWZxDIgG
         mxtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5cR9fTn0Ci4vQt6QkvDxQidJSyqbMLzXLZOoPpJ/Eqc=;
        b=owAgDz4RnZDiEEUIrJmFHSZBdsoFRy7XdCXrnqo/+uJzeAD5Kx4yD2gzHjojqceXvk
         PD9OGUQO9sRW+KCmqkIxuW1Lna/u5XMSHoKC/MDaIZiVZr4aRp+uJefTpifBGsB4FpSO
         PrAEttQLFD8DL7VWxf+hL64nRSR83AJjowYjBxnFBE3VKPGRUn63XHOP4+wvC6Z6jClZ
         oHt4dG+i+GwE9wwkrdm2Fnn36J8YGlTmX0HSwLyosWZATNZ6LE4vZuWdXx46MhGM42AX
         YhL/AjOoR3rx5yF2hB+01XESyQHAFMg1+Vv+0R9TseNaaH5hbk9HSXZ8PIK7R52zgWg2
         22MA==
X-Gm-Message-State: APjAAAV/F78sab+rUXald7nxkm61G5jvl24KyJoimdTnoyNy83CZbPbo
	1ObCP8G0GJOa6E54UTgEET4QeouWx8r7PxSF6M8=
X-Google-Smtp-Source: APXvYqz9QwrPM7DUKepaAnF7jTKJ4VTvDiFfQvExJFXbkWt4crEx/A8OXwqhaM2kUw6Pzf32yygrENBAVa/F5KNXdwM=
X-Received: by 2002:aa7:cf81:: with SMTP id z1mr8458067edx.234.1580312591013;
 Wed, 29 Jan 2020 07:43:11 -0800 (PST)
MIME-Version: 1.0
References: <20200120235453.11518-1-rebecca@bsdio.com> <10748.1579564602739277181@lists.yoctoproject.org>
 <15EDD2ED2558BBB4.24731@lists.yoctoproject.org> <CADkTA4MSjsL6bp66-u8mh4YEaZwF62_ArLqcLsOSQcYrBAW6kg@mail.gmail.com>
 <8b0dd59e-b092-53e0-f1e8-28a33c060843@bsdio.com>
In-Reply-To: <8b0dd59e-b092-53e0-f1e8-28a33c060843@bsdio.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 29 Jan 2020 10:43:00 -0500
Message-ID: <CADkTA4NxEEQnnkvynU69q4KCtdYKWrrbwGkwBRKBpG7eEamTzA@mail.gmail.com>
Subject: Re: [meta-virtualization] [zeus] [PATCH] Update uwsgi to version 2.0.18
To: Rebecca Cran <rebecca@bsdio.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 27, 2020 at 3:36 PM Rebecca Cran <rebecca@bsdio.com> wrote:
>
> On 1/27/20 11:52 AM, Bruce Ashfield wrote:
>
> > I'm seeing two version bumps, one due to a gcc9 (uwsgi) issue and the
> > other a python 3.8 issue (wsgi).
> >
> > Are both for zeus ? If so, my comment applies equally to both.
>
> No, uwsgi was for zeus but mod-wsgi is for master. Let's ignore the
> uwsgi patch, since I've both switched to master and from nginx to
> apache, so I'm no longer interested in it. But I'd still be interested
> in getting the mod-wsgi change committed.

Sounds good. I've merged the mod-wsgi one to master.

Bruce

>
>
> --
>
> Rebecca Cran
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
