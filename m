Return-Path: <alex.kiernan@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 06B37E00CF4; Mon,  6 May 2019 22:57:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (alex.kiernan[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.217.65 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E515BE00AD5
	for <meta-virtualization@yoctoproject.org>;
	Mon,  6 May 2019 22:57:34 -0700 (PDT)
Received: by mail-vs1-f65.google.com with SMTP id e2so9609743vsc.13
	for <meta-virtualization@yoctoproject.org>;
	Mon, 06 May 2019 22:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=m24CYiU0GjmwFzWyQ1Bf+HcLqtmyzIiBnBkAHmvxS90=;
	b=AwWs4CSvjXU0GZeihmmM3EXgWj3I2kPIS6LJCrNPLfSO28kcVZjjL14GbMGGOihH1w
	/vFUGMFTAs2k2qv6oTeM62xAOltkOZTF6L3dbRtbBJajgDTsgykgUf0/LeSDhS9lhBIl
	sbhpdSk8dLEsmbFAMcqxNmgqnrGAq3KLrEW+wZ08YVryBD/QeJ2o23htcobd9HCG/PPP
	zumdhRqlE4xHSLh+tX3GjDLB78hcYiXrxv8nwCeN0Cgay/6XSHp1Hcd6uad/unnTAl0X
	Bb2uWW6LDuU6ktIQXP3imY+yK2kCJrfkcIj2bLqwZJLreKDa5S+3i6zsBZLCxGXDOpif
	6YEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=m24CYiU0GjmwFzWyQ1Bf+HcLqtmyzIiBnBkAHmvxS90=;
	b=jdWHv2b7BHOZBgUd/T00dBJWUeXg79vgWMzCzHl7SpB6J5M5LYmugfGMSV6qwaPXLC
	ggPMdSx8l2SKWKozzZy3NQixMDVBVIJ0qjCieEwLpsN7gyMwE0+UEoIb4zb08HqDX1eL
	trVRguKEs5QTyIVxII2pqC25HOU9DIAQXmxOZqSq1Uy65Y4cJG0Qb0dU+HEzkXKe53Z7
	zbZ8Ki1dN+fXmAM96AWLi7+3Avn9wPQ1zu5KAwInymqOyKV2mcf3GVr4MQpWCzd0EZ2G
	l08UgsyeAPYXGiHWFwFWDW5inBjSTwVwuthWI7lzA2+2JRJkwkpBJ0awNPCqCEhXOjD2
	uwSw==
X-Gm-Message-State: APjAAAUwmKwW7kBe3eD+m7HK2WWvUiahtszM8HQzKYmSO2xOQKU6K0ii
	+rU9KxTZw7tcmKyluwstcyWp3AI2lgbacqgQZrU=
X-Google-Smtp-Source: APXvYqxTorxSyx53fPz0sRrMcUyCXJ0coLNsQOUUcRBGz7P+JGf85EXg04bFjvy5la7zZ3rsL1d7hdHDuUiqAnrFGlU=
X-Received: by 2002:a67:ea0a:: with SMTP id g10mr15334538vso.77.1557208654013; 
	Mon, 06 May 2019 22:57:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190506020001.48490-1-hongxu.jia@windriver.com>
	<08f06729-33dc-4b3a-b129-fece6dc6afbb@betafive.co.uk>
	<CAO5Uq5RZHW+nq=dL8OzPQe_aUpX9vs_C0xog1d9kBSg9oXgbEg@mail.gmail.com>
	<CAALamofMdBe2xdkyfxi7hafL7mn382jubTY5jTx9TyGL0nG=3g@mail.gmail.com>
In-Reply-To: <CAALamofMdBe2xdkyfxi7hafL7mn382jubTY5jTx9TyGL0nG=3g@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 7 May 2019 06:57:22 +0100
Message-ID: <CAO5Uq5Tuufs9-eYGbbTdj9xpmLEn56vEd+XRaywt0G5RtdbP=g@mail.gmail.com>
To: Jonas Bonn <jonas@norrbonn.se>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] cgroup-lite: remove incorrect SYSTEMD_AUTO_ENABLE setting
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 07 May 2019 05:57:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2019 at 5:16 PM Jonas Bonn <jonas@norrbonn.se> wrote:
>
>
>
> On Mon, May 6, 2019, 16:42 Alex Kiernan <alex.kiernan@gmail.com> wrote:
>>
>> On Mon, May 6, 2019 at 2:38 PM Paul Barker <paul@betafive.co.uk> wrote:
>> >
>> > On 06/05/2019 03:00, Hongxu Jia wrote:
>> > > Since commit [154abbc329 systemd: create preset files instead of
>> > > installing in image] applied in oe-core, it checks SYSTEMD_AUTO_ENAB=
LE
>> > > ...
>> > > |ERROR: cgroup-lite-1.15-r0 do_package: SYSTEMD_AUTO_ENABLE_cgroup-l=
ite
>> > > 'mask' is not 'enable' or 'disable'
>> > > ...
>> > >
>> > > Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> > > ---
>> > >   recipes-containers/cgroup-lite/cgroup-lite_1.15.bb | 1 -
>> > >   1 file changed, 1 deletion(-)
>> > >
>> > > diff --git a/recipes-containers/cgroup-lite/cgroup-lite_1.15.bb b/re=
cipes-containers/cgroup-lite/cgroup-lite_1.15.bb
>> > > index 7b48c3a..cb16a65 100644
>> > > --- a/recipes-containers/cgroup-lite/cgroup-lite_1.15.bb
>> > > +++ b/recipes-containers/cgroup-lite/cgroup-lite_1.15.bb
>> > > @@ -18,7 +18,6 @@ INITSCRIPT_PARAMS =3D "start 8 2 3 4 5 . stop 20 0=
 1 6 ."
>> > >   # where systemd is in use.
>> > >   SYSTEMD_PACKAGES =3D "${PN}"
>> > >   SYSTEMD_SERVICE_${PN} =3D "cgroups-init.service"
>> > > -SYSTEMD_AUTO_ENABLE_${PN} =3D "mask"
>> >
>> > Looking at the commit message from when this was added
>> > (http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/=
?id=3D5b13da8e575ac746b46426f2471bf004b2201e41),
>> > the intention is that the service is indeed masked.
>> >
>> > Rather than breaking this behaviour I'd like to see if we can support
>> > this in oe-core.
>> >
>> > Cc-ing Jonas and Alex on this one - is it simple to support> `SYSTEMD_=
AUTO_ENABLE =3D "mask"` after the recent systemd changes in oe-core?
>> >
>>
>> Okay, so going back and reading the code, previously you could say
>> anything to systemctl that was understood by the script (enable,
>> disable, mask, preset), so I think there's just mask we need to put
>> back. That said there's probably a hole in enable/disable where we
>> should delete any existing symlink to allow the preset logic to
>> control it correctly.
>
>
> Remember, the preset logic runs only on first boot when /etc/systemd/syst=
em is empty. There are no symlinks to remove.
>

I'm really thinking of the private systemctl implementation here,
fixing them up during image construction where someone's manually
created them.

>> I think it'll mean that you end up with the SYSTEMD_AUTO_ENABLE
>> control doing different things in different phases, which is possibly
>> surprising, but I think preferable.
>
>
> 'mask' is not something you can do with preset.
>
> The argument 'mask' to SYSTEMD_AUTO_ENABLE in that recipe is bogus. The c=
orrect argument is 'disable'. If you look at what the recipe is doing it is=
 already setting up a permanent link to /dev/null for the service so it is =
already effectively masked... and unmaskable at that!
>

The question for me is, is SYSTEMD_AUTO_ENABLE an interface to preset
files, or something broader; where we were was SYSTEMD_AUTO_ENABLE was
an interface to systemctl, now it's a much narrower thing which just
gets you preset file entries.

If SYSTEMD_AUTO_ENABLE is an interface for controlling the general
systemd setup we avoid manual symlink creation and have a place we can
build out the stateless stuff - to me that seems like a better option.

The other thing which I suspect we had and now don't was the ability
to use enable as a mechanism for instantiating templates.

Something else that bothers me, we're doing the exact opposite of the
recommendation in writing preset files as part of our packages:

"It is not recommended to ship preset files within the respective
software packages implementing the units, but rather centralize them
in a distribution or spin default policy, which can be amended by
administrator policy."

But I don't have a better answer right now...

--
Alex Kiernan

