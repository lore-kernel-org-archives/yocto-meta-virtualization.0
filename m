Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.8261.1631277307363576196
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Sep 2021 05:35:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Qu38iLJ+;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id t6so842273edi.9
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 10 Sep 2021 05:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m6omcPMtndRii98rultQCYehCfO/my+HfLl3YfA/Hrg=;
        b=Qu38iLJ+y4oLyjYdTZhR52oUXzSGKhyAw7Bz6qbdVEV1C7NW5m6tqxAJjgV4s1IieM
         56o5wFcI8r1sThRvycQRORwf3em3vkl36SJjUUGOFHxRi4vNpwD/LFnK3ZitVdCLefmF
         W8W0VCiQhPk43o25gnWvWTo+nB5OJINwxcHODxYmPOP/TIdXVzynzUXcOAtkp3qvqvxo
         8a3mhJ+helxoVA4g+wb6PQqtOnqjnToqICixnRTuU0z80PYAOqe94XAwjYVRugztIlhd
         3evNLz5fFyPBt13Aw1cRGMc8F6Zt+I7E5WfBajkeMQSu95Shj+g6d9wkrgiJle31ZyDf
         xzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m6omcPMtndRii98rultQCYehCfO/my+HfLl3YfA/Hrg=;
        b=wyWfIR7bPwSF1WGzKsTJZyixD/I9U/y1aHoHmK9/fqbgB2/CpR0z66GcRnDkzKaidB
         er1flwVkzkbBJsb2tASMYhDH0bu/b4ImTNuUqH0q7W9Wu20EfCaMl7QBGwk4+f50EyJz
         yCWuNOyL2+QBFR9fMhcdLWz9K5indaHcBgtKXnyOFoHUlw1eBcTXs+IeDb5h1ektJ/y4
         11bBIfbrlXaJsq48Omab5J9jICI1vdZ07cpob18qPF9peu2E62iGhXPHlpuFmfiug43a
         BG1U129VwNK2pitHY1eMI5znWdwFCBd8IcXUl3xuFfhjBVuZU9FeJhfT4y5UkONybdrW
         xciQ==
X-Gm-Message-State: AOAM533luUN9GiF99n5jk+zMG9gRdDMCXM+VeoOoC664FOmWCpk0HPyR
	fArthkVotxjZHFTWbU4q67LksSfHo8pwZRpUgCA=
X-Google-Smtp-Source: ABdhPJwGTmbsVcaXXAdA36dZaGgi5VynoaCWL5OcjeheX7dud5HrlLP9PznH9mBX+Y1sZPBaAOWbLlJwra5y1G1brLc=
X-Received: by 2002:aa7:c806:: with SMTP id a6mr4430843edt.354.1631277305754;
 Fri, 10 Sep 2021 05:35:05 -0700 (PDT)
MIME-Version: 1.0
References: <729c3f470eb64e3a8832e3e70c8da768@axis.com>
In-Reply-To: <729c3f470eb64e3a8832e3e70c8da768@axis.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 10 Sep 2021 08:34:54 -0400
Message-ID: <CADkTA4PVaJRsbzw8E8cco8_F8u-g2J6v9S9eUqygTK+=8C70Tg@mail.gmail.com>
Subject: Re: [meta-virtualization] thoughts on k3s and supporting builds of more than one k8s version
To: Joakim Roubert <joakim.roubert@axis.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 10, 2021 at 2:49 AM Joakim Roubert <joakim.roubert@axis.com> wrote:
>
> Hi!
>
> I was thinking about k3s, and now that the latest stable k3s is a Kubernetes 1.21 version:
> Do we want to have recipes for multiple k3s versions? I'm thinking someone perhaps wants, say, 1.20 to go with a system with 1.21, while someone else perhaps wants 1.21 to go with 1.21 components.
> And then have a common .inc-file with everything that is not individual for the versions, and small recipes with the source revision and such for each version.
> What are your thoughts on this?

I've held pretty firm on not having multiple versions of anything in
the layer. Multiple providers, yes, multiple versions .. no.

It quite simply splits the testing,  multiplies the support and is
distracting. And honestly, you'll never get any agreement on versions
.. I've been there and done that.

We don't even like to do that with the kernel in oe-core, but our hand
was a bit forced on that front (and arguably the kernel is actually
easier to test).

For a version of the layer that might be released against a LTS, the
plan was to match up a LTS version and "the latest", but for
intermediate/non-LTS releases sticking with one is the goal.

Bruce

>
> BR,
>
> /Joakim
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
