Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web10.42420.1591031395817052777
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 01 Jun 2020 10:09:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hJPfVJJg;
 spf=pass (domain: gmail.com, ip: 209.85.222.51, mailfrom: aljoscha.lautenbach@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id r9so250544ual.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 01 Jun 2020 10:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h0sYTrLDAPH/TSdPidx1yS4SHa4rWIFmU5kyytBX5tw=;
        b=hJPfVJJg+GOB/f90IZEGCVfN4CC6CL66lfdb4GmMU0Z8FjqxV9Dg+c3qECaSTbQe3P
         hmTRQBCtilQswtBwhWwLZx0Ehr9kMwd3f790+WAEtkfPQbzggNzs7EFLrwUvS2D58jFz
         GJTjCEVZP4TTFC9kEpo0i9RNX9ZLDewmy5gmNXMryFWqOiY8wcjZIJOo9y+cr1K3BNgZ
         LBOYDPxqPDvUBggKrzCVTradrn0172VoVS05x2yNswHtgn5XdLDYpcYbPZHFUtN/XN/q
         /Nj4DPxYyzMj/6UmxfgDvdpyYP+6isX9aUhx+EnprwwxuyCisUpzJCHv5rwdL+zV/10n
         Z28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h0sYTrLDAPH/TSdPidx1yS4SHa4rWIFmU5kyytBX5tw=;
        b=TwKbiEKukbmFcqUE12X2MECUsVgwvmYzWUQ1PK4kfPwXk4oQLeUUsu5HPS5LLyt8VC
         H6DmhpAFug5sJ7W1lmV4P7DHmx00ed7nntaRvGKIaT1iyuCUjETXfZ2mnJEUppC34KNg
         OgfygF5bihp7siyLq5SVH/sl/pjItS465uhYa5FDn4byR4qxDp/nw5ZwnhtPoGpkROEF
         D5+qT3ITTuM/UpqVTwlpU2/iPlJVcKnwTOUEzoP8cMOYu/1SFchinq7DNPvX/k30YggE
         SO/YWZiwhr4dnhTrhzAfvTepp4jv9KNRt43/Nm74vGRp4O4kz/uBZgA+5BDQjDUb1Nhw
         /BOg==
X-Gm-Message-State: AOAM530QY3FkuXssVRWm9ZfBSKcGbaDM9hTZLg8Oc46pl/h53yuRNsRt
	EkFhbSXxCzhszuYxAUJH7OK3qpi8Dhwrb5UvLw8=
X-Google-Smtp-Source: ABdhPJyFtUpK4oct3hItnwVAY7iNdFUR81aKWlhK2ZdYV+3PZU7Dz8lR57rx2a5VqCRmMfImy0kHfGeT2JCvq1OhQ9o=
X-Received: by 2002:ab0:6642:: with SMTP id b2mr14715568uaq.92.1591031394981;
 Mon, 01 Jun 2020 10:09:54 -0700 (PDT)
MIME-Version: 1.0
References: <CADkTA4PtMq=itf4jeG0wi8Z=pFqrZYoVntqukDKAPat4zPspEw@mail.gmail.com>
 <8542.1590987130301454950@lists.yoctoproject.org>
In-Reply-To: <8542.1590987130301454950@lists.yoctoproject.org>
From: "Aljoscha Lautenbach" <aljoscha.lautenbach@gmail.com>
Date: Mon, 1 Jun 2020 19:09:43 +0200
Message-ID: <CA+yZB6ZfxhoQU_PhU=zKu0snF5vLj2xOg3T86sR-YoLq8AmhNg@mail.gmail.com>
Subject: Re: [meta-virtualization] Failure to build xen-image-minimal. Yocto bitbake failed @99% while building xen-minimal-image
To: Siddhartha V <Siddhuvgowda.18695@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Hi Siddhartha,

I don't know if this is your problem, but it might be. Three months
ago I had more or less the same question for the Raspberry-Pi 3, you
might want to read that thread:
https://lists.yoctoproject.org/g/yocto/topic/71688106#48662

The problem was that the meta-raspberrypi layer uses an incompatible
kernel recipe, so you have to manually update it. To quote myself from
the thread above:
"If I understand you correctly, I need to add a
linux-raspberrypi_4.19.bbappend file in my own layer that applies the
Xen configuration fragments."

I later found out that the Raspberry-Pi 3 is not supported by XEN
since it has an incompatible GIC, but that was a different problem. ;)

Best regards,
Aljoscha
