Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.11487.1603791042769432698
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 27 Oct 2020 02:30:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=EsElhmrd;
 spf=softfail (domain: konsulko.com, ip: 198.145.29.25, mailfrom: paul.barker@konsulko.com)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	by mail.yoctoproject.org (Postfix) with ESMTPS id A7D5C38C089D
	for <meta-virtualization@yoctoproject.org>; Tue, 27 Oct 2020 02:30:42 -0700 (PDT)
Received: by mail-ot1-f52.google.com with SMTP id b2so548493ots.5
        for <meta-virtualization@yoctoproject.org>; Tue, 27 Oct 2020 02:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=taAl6IZt1qQLOo98ZbuyZQ0fe7JNSsM9kYLc/30TH9s=;
        b=EsElhmrdyz9k6wEwkEHq4rNfGSwppsF+Cs7T+AFyarkqTulXR+bv9ilCvTd+Z4DB6U
         JdHEOl0o1sWDEt6mo8E7lWHRT+XFMMmkF93UY+1QulfKVXuCkaVj/w8DaRIX7MhjCweV
         bUIYACyH1I/zILFqAl8vfoD+6dnK/XA5lJJoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=taAl6IZt1qQLOo98ZbuyZQ0fe7JNSsM9kYLc/30TH9s=;
        b=K4TLa0dOseEfT6vwtMggRAErdvO9YRYDAjP4qwgpbKFpsp9yfu3PGtDlgBD9rsHUq0
         OWYm8Uv5zjST9npZX1o8HYlGke1MGb6O9C9/288jACl2lfEBcoOHt5phn4z+4qjhY/vw
         CZyNHVtDnbItZ0kf4Wf6P2pLiGCfHdy4JhRqBWzRwCxDcQBUjNez4URTUkXMPafc3olV
         e/bM/vUETKigDxhROOfAug9PTwQccHl4IbjqPt0AQpXFPbqT/o50/7em8fIt5K7HRad1
         jY939jxQURckXo5HFigZvcdO4reTsS0q194tyX+BxGLDMOzTkYluuwPTyDCh5vm+kViO
         ++GA==
X-Gm-Message-State: AOAM530F75PaS1WecjB63kQ/qU06RnpXgz2fC7K4A5pC9rpzDX21bBcV
	lMnn4rU7SIiXPEayemKh0c7tHsnbbNrVpLNNtZPSlRrxYp8=
X-Google-Smtp-Source: ABdhPJwOhHRg3TKhZ5LM1hbLRgyFXUvzUl2ELyaXHkvT3qXewkom4TGzWay6EEs0BH/kBWaqvm751UgcJ4vSnJTCuI8=
X-Received: by 2002:a05:6830:11c1:: with SMTP id v1mr844086otq.258.1603791041693;
 Tue, 27 Oct 2020 02:30:41 -0700 (PDT)
MIME-Version: 1.0
References: <b2b268d8-8c1a-2424-2029-7238e52404f8@optimcloud.com>
In-Reply-To: <b2b268d8-8c1a-2424-2029-7238e52404f8@optimcloud.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Tue, 27 Oct 2020 09:30:32 +0000
Message-ID: <CAM9ZRVuxy0VJg45OiQy4OW4P5b7ioV_Gyq1fheCmDxatTG=TSg@mail.gmail.com>
Subject: Re: [meta-virtualization] is meta-cloud-services/meta-openstack useable, or a WIP ?
To: Yocto <yocto@optimcloud.com>
Cc: "meta-virtualization@yoctoproject.org" <meta-virtualization@yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Oct 2020 at 09:16, Yocto <yocto@optimcloud.com> wrote:
>

Please set your name in your email client to something other than
"Yocto" so as not to mislead & confuse people.

-- 
Paul Barker
Konsulko Group
