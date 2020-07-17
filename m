Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.1675.1595010610260509264
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Jul 2020 11:30:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EjB8lx5I;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id br7so11844868ejb.5
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Jul 2020 11:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+624JfrD3JC33zLC3R9yqOCPy3MV5Q7W6U9ZGiwygg4=;
        b=EjB8lx5IIp9TdWH8cCiUonBTpWDgDF2EmmYgETyrWg12YGsCDp4Lc1YyctoDU+64IG
         ZPpDDHb0L2FOsV6zJJ8e0gFIhUiPHFMgyD8dXkaX9DUU/KQa8ymKFN4JSJQ0CxWD4p1y
         jC+k9ZcaRAMHqtNoTrtPtsxXcSD6Uxq5qq4ecFKASO7FnWGg5nrik7DQjy0HZi0bDyJS
         ZwVFTvuL3W9xsXuda2lLzIGaDhMQXZLv/ofVXH85BKTHsROb5kKV2K89/tNXtqbKLgS6
         W6Ed5fyku1i3WtcOciNY691+tIqW9mdTLMQByox7aDZirVIcfe9cPxJMvxVFEnKmmBLO
         Qdlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+624JfrD3JC33zLC3R9yqOCPy3MV5Q7W6U9ZGiwygg4=;
        b=J8qFXYVTPiDTGVkUUnAcWt646/8Ilr5eXgbp5u5YCR33c2D46HQkzXicW+HfVP/qOM
         6aj0ihGa8vZmTF8xZxNTFULo61HLMVgyL7SIqM71PYH8+5iMM4KcGhn+O93vixvZHdh7
         btBNaf0SHJg9antkjqwgbM8hz6GXQNld/9o3VtpI/Vs+fu/zNZ8m4RnbIYwCJSCvg2m0
         IQFJHCML1Cb4FtLtSdTI7z1STFMV3t+kkfVyYP4KllK0sfVt7uUDc7dywlKF2w5Tq4IG
         sKaFioJ4mRcu5ppeXz5ayV+dh8Sw30eM0nhfbBbEmUcuHiexp4egZ5KHkl4rG2z+rkPZ
         s6Cw==
X-Gm-Message-State: AOAM531jQW8xN6/YqcMdqKlo1BNbnF/BqqkPEXGvWTLw8Lmq7S0EmqnC
	c3WZBCaEu9uxnRXpgElAGRBebrSY47DGb3aqpss=
X-Google-Smtp-Source: ABdhPJyPa5q7zJlw6a5NWe2lhadqxjxFtFFFsuKGgZ/W6cfRzIJp2DfVk3cnGDsfCuGllx9rC5c5a0IaHZduBElP6j0=
X-Received: by 2002:a17:906:899:: with SMTP id n25mr9278758eje.298.1595010608606;
 Fri, 17 Jul 2020 11:30:08 -0700 (PDT)
MIME-Version: 1.0
References: <7Rna.1595008592154117129.JcM3@lists.yoctoproject.org>
In-Reply-To: <7Rna.1595008592154117129.JcM3@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 17 Jul 2020 14:29:57 -0400
Message-ID: <CADkTA4MibxX6U2HThMpF2pvOkJuZZDBaJVhQOkTUSmtr_e2N2A@mail.gmail.com>
Subject: Re: [meta-virtualization] image-oci.bbclass creates faulty arm/variant entry in index.json
To: Robert Berger <robert.berger.yocto.user@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 17, 2020 at 1:56 PM Robert Berger
<robert.berger.yocto.user@gmail.com> wrote:
>
> index.json looks like this:
>
> {
>   "schemaVersion": 2,
>   "manifests": [
>     {
>       "mediaType": "application/vnd.oci.image.manifest.v1+json",
>       "size": 420,
>       "digest": "sha256:63f34b526be88da860b1ae7969430bc7d20f233a58e13fc0f3770e61e037ebba",
>       "platform": {
>         "architecture": "arm",
>         \"variant\": "v7",
>         "os": "linux"
>       },
>       "annotations": {
>         "org.opencontainers.image.ref.name": "latest"
>       }
>     }
>   ]
> }
>
> \"variant\": "v7" should be "variant": "v7"
>
> I just hacked it like this in one of my custom scripts:
>
> sed -i 's/\\"variant\\"/"variant"/g' ${OCI}/index.json
>
> But this is not an appropriate fix.
>
> The problem seems to be a combination of image-oci.bbclass and sloci-image.

It's sloci-image. I'll pull together a fix.

Bruce

>
> Regards,
>
> Robert 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
