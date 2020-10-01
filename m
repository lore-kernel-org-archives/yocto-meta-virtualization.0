Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.9501.1601548331064056396
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 01 Oct 2020 03:32:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=DVzsXxS0;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: joakim.roubert@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=640; q=dns/txt; s=axis-central1;
  t=1601548331; x=1633084331;
  h=subject:to:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding;
  bh=C3VwUPGsNIzb5BndmXkhLp1P43CqxA1PyLctrrocSJ4=;
  b=DVzsXxS0Myk4tKOQzhmZkGtqkWKUpwN8+I5VmwCu0DCmFP5qQ4Q3beod
   L+PTz+O/6pTuWPL0D5rC43Q4KOQgOFe7fWyOZP3KASj6f67tugvLqBZMt
   heQxRH8XpASHQHkdl7V2cBXTou21NeXkBbVObmRgMj8Ax1Qxamc0cfB61
   hf7crtS8VgXC1bLL5B69SEy0UZrS0UUicAo8eyuDqM/XyJuBtSHlEwtvr
   MlJXISlwykHZqhe917YsTjelA5DVrYPAw1IFZAXVRInKeivtK2fwlBpP6
   SIVcA8OfljZs1QbqS6q11WyELYTbbLc5KOz1/+WEwlE6RqPaf8S0mPHEv
   A==;
IronPort-SDR: o1vA9BIlOrmPFUq+SeSPD7grCMigIV+hzCMSbq/cxcdSLIgmGUCjUZPRs47kDnM6+jxkYArsqg
 6V8ae3K8gML7TJcnGPTgulJ4CcB3yZZkP/7MIjxWnbJHmAcEIUecVPgBdJ2r4Ao8bjkLFLIc5s
 QduYb6TJvb+U6LKp7Eok/ZfxvvM3NJDE+NvoNairq5a77RY+SXka4Gb0AUreeb4nGAwiY20sKV
 kUhEDn3SZG0d9OW+uMyYfddcjhIom3iVvk7Cr2d9deyUO9B5fKo8ns0FdDtNfngYeOKDA6BB0M
 Mg0=
X-IronPort-AV: E=Sophos;i="5.77,323,1596492000"; 
   d="scan'208";a="13552321"
Subject: Re: [meta-virtualization][PATCH] Adding k3s recipe
To: <meta-virtualization@lists.yoctoproject.org>
References: <20200821205529.29901-1-erik.jansson@axis.com>
 <6adf1052-aa13-b890-606e-119d70eab618@axis.com>
 <CADkTA4Mkpo9S92Pfqd_eDYiyt+3zopP9p97JF3yct2TWuc3kNQ@mail.gmail.com>
 <c13a622a-5d4c-d87e-f901-673bec12fe33@axis.com>
 <CADkTA4MArixWsydAc1YdwCvyiPHx36nqcigpLf=j_Fw6NudnRQ@mail.gmail.com>
 <ae269803-37c4-d72a-d19e-097a093baa60@axis.com>
 <CADkTA4NbKfrK0CwQz7P5ecGCgL_d_0CZnuROoVTL=iLWJ6kvMw@mail.gmail.com>
 <8943d000-4ce1-164b-eb8e-2bedfaca2981@axis.com>
 <CADkTA4PNMnRJ3iZu0TvsK+8S_MMySNxx-=fk7rFuCCOStcRdWw@mail.gmail.com>
 <16380B0CA000AB98.28124@lists.yoctoproject.org>
 <c381ef59-ef51-840e-626e-ddb3e5706757@axis.com>
 <CADkTA4PMkHjKHmb0iwR1+xcu660xBGOBTQH0+exqfGL-VNhdAg@mail.gmail.com>
 <1639818C3E50A226.8589@lists.yoctoproject.org>
From: "Joakim Roubert" <joakim.roubert@axis.com>
Message-ID: <d903ba7b-8729-4a05-0aae-a9d0633cc50b@axis.com>
Date: Thu, 1 Oct 2020 12:32:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <1639818C3E50A226.8589@lists.yoctoproject.org>
Return-Path: joakim.roubert@axis.com
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX04.axis.com (10.0.5.18) To XBOX03.axis.com (10.0.5.17)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2020-09-30 10:12, Joakim Roubert wrote:
>
> I have added that now; I am quite sure that Erik is the author of those.
> By the look of the coding style, it sure seems like it. (I have sent a
> text to him just to verify and if I am wrong in my assumption here, I
> will update accordingly.)

Update accordingly: the last couple of lines in k3s-clean are from 
install.sh's create_killall.sh function. I have now added a comment that 
clearly states that. Hopefully now everything is in order so that we do 
not claim someone else's cred.

The patchset with this update follows this reply in a separate e-mail.

BR,

/Joakim
