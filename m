Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web08.12732.1603800339128795015
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 27 Oct 2020 05:05:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QHZIF0Qy;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id ce10so1859235ejc.5
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 27 Oct 2020 05:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AjeHWP11+oatMCMT7DGVm4HoW6bWCRDGcyqZGqAIhzM=;
        b=QHZIF0Qy3vUD7hE9ttCwXi9zP6uXM2lw/xLwwXyuIQpz5edo1LSbx/kNYEiTBROx57
         4FjgD8qhUKj7hoz0veKqubomTh+EwBA8SJ+u0uiGtZrh3dG8hPkrtGa64pW8qIVmc5FY
         8zM6J2OQJiU1Rz7J43EyU/7NIiJQ1gjncvZVx48KOWseHFlSN79iU6lcpV8iael58mZn
         C/7JNZtnAZ5irnuCqv3l2ZO1x5bZp6wi8OYJ/OGWqlX0jt3A9pN90FCFPB4RsT4u4FW5
         Y+/PLrdmE/1HMJ6jUvjD7lXiGS8B+IUstrgG3clZx/kVSYU70vaCV95/D7OrJ8Zvh+IM
         6N2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AjeHWP11+oatMCMT7DGVm4HoW6bWCRDGcyqZGqAIhzM=;
        b=ASVJugZIzneVLjJE/wpAsjUl3mPOwTfDVALl/QGoHuSeX01kfLZnMXFbYpssSdat30
         TH0vrStgFt/iCOuqVedDXQAze+5BC0Jc1r3309knhuBHghpWf8HRnNAFG2hmipqsnfbz
         N8O03xhO3P7c3uPgk3i9xEEzlwt4rP8Gvc0SRql54iUmF/tslG9iBJHrE4uxI7/0KIhK
         u+c7kUgOm14PEZEQhEtQ7q3tf5RNCfgPv045C0NRKOWrlX25K3cArkv+zegUER9h9tp/
         zPxsPYaXsuhYhJf/MxGbjSPs0yfxjYLpgu/vDw7jSdwvZsHPTlOtbiRx5F4x0FePNFLk
         OkFA==
X-Gm-Message-State: AOAM532g/lcXFpMj9CeM9JXM9qQSbgaylGWzztVhnGC/cHC5sUoVRotA
	dKSP/0MjRXIM4y4Ujrz4p4ZU3GUwTPuCiWWdfCg=
X-Google-Smtp-Source: ABdhPJw6mEE7gR7T0XUQ+bFQ40D/1vvcOKhIkXfrTQGVO/0kOaiDcZ0F3x3LbgnxSSZFa6P68tHCyUU80NFAx6QpfGQ=
X-Received: by 2002:a17:906:cc18:: with SMTP id ml24mr1974584ejb.298.1603800337559;
 Tue, 27 Oct 2020 05:05:37 -0700 (PDT)
MIME-Version: 1.0
References: <b2b268d8-8c1a-2424-2029-7238e52404f8@optimcloud.com>
 <CAM9ZRVuxy0VJg45OiQy4OW4P5b7ioV_Gyq1fheCmDxatTG=TSg@mail.gmail.com> <24a6f227-7d2b-cd96-e35b-d3f16546f51f@optimcloud.com>
In-Reply-To: <24a6f227-7d2b-cd96-e35b-d3f16546f51f@optimcloud.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 27 Oct 2020 08:05:26 -0400
Message-ID: <CADkTA4MJOgFdLUdPS8AY-+Hy3-dGqsSD5uKWWdpVWZuHj0mfWw@mail.gmail.com>
Subject: Re: [meta-virtualization] is meta-cloud-services/meta-openstack useable, or a WIP ?
To: Yocto <yocto@optimcloud.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 27, 2020 at 6:05 AM Yocto <yocto@optimcloud.com> wrote:
>
>
> On 10/27/20 4:30 PM, Paul Barker wrote:
>
> On Tue, 27 Oct 2020 at 09:16, Yocto <yocto@optimcloud.com> wrote:
>
> Please set your name in your email client to something other than
> "Yocto" so as not to mislead & confuse people.
>
> I already did that, its Y L Reddy, email addie is yocto@domain.com which gets mail for literally every yocto list, as it was mentioned before i did change the name... to Y L Reddy
>

Your mail client (or however you are sending messages) is still
misconfigured. It isn't filling in your real name, along with the
actual address.

Hence why I agree with Paul, very confusing as it comes through. In
particular, since your message isn't closed with your name, we'd
otherwise have no idea who was sending it.

Bruce

>
>
>
>
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
