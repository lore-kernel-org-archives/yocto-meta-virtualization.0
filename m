Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web11.39625.1600686777083533535
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 21 Sep 2020 04:12:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a+yKn1B0;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id q13so17090139ejo.9
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 21 Sep 2020 04:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hTcqYlNtV2QnNhOgWMAzYClQB3WCIiG8k19cQKsHTGo=;
        b=a+yKn1B06bdI3Zy7xATcMMqL1Xot8/LYl+ir68iPY9C8RuKnbwxmiA5dCsal0TOB8+
         u0AD4dORvM9a7xVA5es5GBkHsFXx+U3D7ng2dSTma4kHj2SuEVXQD9kA3+t40sf0HU7B
         W48s1BYc2Gcr3rKWSuDkpDTZZh6evDddvhh+fqnjl52RRo2HY+PDaXIItPvvqgOG17HO
         o8WadefLIMQMehvwdAQUH0di9VS083NpMH0rog+Ni3O9gTVCW6PX7skh30YVlb0Kmy+d
         TaO07mdEWJ28OePfqj/keRO6m8o2rCvIN/cXYOjKHBGHcVt7/HOvVPU04dsYdrY6Me7J
         WMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hTcqYlNtV2QnNhOgWMAzYClQB3WCIiG8k19cQKsHTGo=;
        b=li40oPI57dj008MBNUfmLe40a6ZlMkKzDISRwJUX9IzSOOFgvKWC/3EGLbNIRl6W2d
         YaZVmR4lS4LRFM7LfMqGcb+dYog417FyJRAOEaMoT2tr9fLWrZ1ug8XiGrh1KJxa6Vvm
         NnxZBIKWWSWAp1zXR3jsq+ffF23EfTqOZZ87+pj0BiYx98Ua/auyK5tUi0olrmcMEKL7
         E9D6+YlHtkfibOOEXhBT2xT4Gc0kJYq/yaoQKW+xDmg15YavKwK9PC+vuFb+4ZATZ8d1
         onAcQ9nNZhY7kErZCIit6u7h2hQW/TkBo9u7u9cHarwy8sKGTbAsuYq8zPoaMM2IeHdt
         ZmSA==
X-Gm-Message-State: AOAM532rTzaBPE6AbRaYGsT+BBojZxDsw6EhoYXswLwuJa1ij7izHgyd
	EYNhwSWfc/DuVN5bj/NaSM8RH2hd52YFY2qHAPbIzz41MH4=
X-Google-Smtp-Source: ABdhPJzBXivDOhhXroPMREGrnlxDr/q3F1KrwJ6axqUe3Myyu+1hap7A9HgHg7/dC7mybMDyKSVcF9tnEPg618PlNeo=
X-Received: by 2002:a17:906:fa81:: with SMTP id lt1mr48734450ejb.459.1600686775440;
 Mon, 21 Sep 2020 04:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200821205529.29901-1-erik.jansson@axis.com> <6adf1052-aa13-b890-606e-119d70eab618@axis.com>
In-Reply-To: <6adf1052-aa13-b890-606e-119d70eab618@axis.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 21 Sep 2020 07:11:38 -0400
Message-ID: <CADkTA4Mkpo9S92Pfqd_eDYiyt+3zopP9p97JF3yct2TWuc3kNQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] Adding k3s recipe
To: Joakim Roubert <joakim.roubert@axis.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

It is close. I had to abandon one approach, since it grew more complex
than if I just let a chunk of functionality be duplicated.

I'm at this again this week, and if I can't sort it out, I'll merge
the core recipes and start factoring in tree (I'm just worried about
people assuming what appears in tree is the final version).

Cheers,

Bruce

On Mon, Sep 21, 2020 at 4:38 AM Joakim Roubert <joakim.roubert@axis.com> wrote:
>
> On 2020-08-21 22:55, Erik Jansson wrote:
> > Signed-off-by: Erik Jansson <erik.jansson@axis.com>
>
> Bruce, what is the current status of the k3s activities? (I know you
> were busy with some other things last month.)
>
>
> BR,
>
> /Joakim
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
