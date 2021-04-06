Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.11206.1617712605666081877
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Apr 2021 05:36:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YHLwXtp7;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id mh7so11684761ejb.12
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Apr 2021 05:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7MoOiJyUcRVCOT+HSCWwjlHaSe2eNsqAcS/veKUUvXs=;
        b=YHLwXtp7F/rTaE4iyebKZjfgfF5InsV0uK6Oiz2q65X7On+FHX3qls4TpbQu9uHbLl
         07+o0r6kpHoFUdJHMw7FQy0p0/Qpc2r4mqWxqc1aeu1VmY5L8fcISHaWDr9mWhfeikUo
         ImaNYhaiGw9LvHH6Nz1XTNzjHn5em0q77N2x47Uoft8DLZNYTsLw1wAA2ccXahBDFidR
         FsXp6KsVluzIPYg5DQ7YT/ZgnXFlH02+/VYl3dBSmBsDGrqyl5fFvkGhN6zq1SsMJAMv
         2dKhWAh8eTJSeKhLtp0cEkCYuzRGA0ylc5oG2JM3ZEJGddGINs8mDYGRqtzxPZlnP0Er
         V3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7MoOiJyUcRVCOT+HSCWwjlHaSe2eNsqAcS/veKUUvXs=;
        b=coT5+ARbXPRxk39oEcAHmIHtN4G84PDhbaR6YJlt35qvx36Po7PV/+bc1wfHlGvJ7p
         qHTWHswsHBcsvVucQ3tnfTulQs0hN5T5bHEifKlUqJAurOo4v9BlrOVQAsA3LpUY3W7S
         B5XrUa+SXq3QnkxD7j+iD5l2v3eIL7gkDi7lH7LOF95c4gHr0fElH1FGbmSXb3TklLBJ
         igNt4t3TcvHjtVGwRRPys+r3ePLEkgsPQE45JEZ9F/oypnfyi1v239HQod6PLd3KF0mb
         VcHWp6VtQWVWxeUwNff/MxRtoCwecf5cjdtGieC1cRG1QYgg1DOPEhPA31U0xwJVgc/b
         L6Fw==
X-Gm-Message-State: AOAM532mudXDyt1w/g2FmQtgs8MOv1Q3g4cskPOYmfSiLcDFCpdzwvdD
	3MRC0thfEFN70/h7qtIw72d3kxkthz/70SF+8yE=
X-Google-Smtp-Source: ABdhPJx8koD0HA1od58TJBOZ936RRxcZnmecot/2Zmm2iWijzfXnl3N7JjrvY4afNlF4CGoxFHVOmujQTFzVq3Cbw98=
X-Received: by 2002:a17:906:11d1:: with SMTP id o17mr33927053eja.517.1617712603963;
 Tue, 06 Apr 2021 05:36:43 -0700 (PDT)
MIME-Version: 1.0
References: <f65d58c1-c178-9980-f835-418f5bded250@crashcourse.ca>
In-Reply-To: <f65d58c1-c178-9980-f835-418f5bded250@crashcourse.ca>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 6 Apr 2021 08:36:33 -0400
Message-ID: <CADkTA4OhSe3z5Dv=SSFBA2dg_GZurw2QqjW=jxdu1ZFW__8EZg@mail.gmail.com>
Subject: Re: [meta-virtualization] "FILESEXTRAPATHS_append" error in openvswitch_git.bb
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 6, 2021 at 5:35 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>
>   this doesn't look right, but i don't know how one wants to resolve
> it:
>

What part doesn't look right ? I don't see any issues with it.

Bruce

>   FILESEXTRAPATHS_append := "${THISDIR}/${PN}-git:"
>
> so i will leave it in your capable hands.
>
> rday
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
