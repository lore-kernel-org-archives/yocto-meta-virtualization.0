Subject: Re: [[meta-virtualization][m-c-s][PATCH]] salt: bump 2018.3 -> 3000
To: meta-virtualization@lists.yoctoproject.org
From: "Fagundes, Paulo" <paulo.fagundes@opengear.com>
X-Originating-Location: Orem, Utah, US (76.8.212.3)
X-Originating-Platform: Windows Firefox 68
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 24 Feb 2020 13:45:56 -0800
References: <20200224200705.3445460-1-paulo.fagundes@opengear.com>
In-Reply-To: <20200224200705.3445460-1-paulo.fagundes@opengear.com>
Message-ID: <22510.1582580756302855054@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="BpFOqgBZyEgf811lp0V2"

--BpFOqgBZyEgf811lp0V2
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

hey everyone I've uploaded a patch for upgrading salt to the latest v3000 v=
ersion (codename: neon)

this patch includes the following changes:

- upgrade to salt 3000
- use systemd
- make the set_python_location_hashbang.patch also change from python to p=
ython3
- reworked do_install_append()
- removed the tornado dependency whereas it is now vendored upstream
- removed most files in the files/ directory whereas those are already pre=
sent in upstream salt/conf and salt/pkg directories

After uploading the patch I've noticed that as a result of the changes in =
do_install_append(), the following config files are no longer installed aut=
omatically to /etc/salt/
- cloud
- roster
- cloud.conf.d
- cloud.profiles.d
- cloud.providers.d

I could add back the above config files and upload a new patch, but I thin=
k I'll wait on feedback before uploading a new patch.

I'd be happy as well if someone else picked up from where I left off :)

--BpFOqgBZyEgf811lp0V2
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

hey everyone I've uploaded a patch for upgrading salt to the latest v3000 v=
ersion (codename: neon)<br /><br />this patch includes the following change=
s:<br /><br />- upgrade to salt 3000<br />- use systemd<br />- make the set=
_python_location_hashbang.patch also change from python to python3<br />- r=
eworked do_install_append()<br />- removed the tornado dependency whereas i=
t is now vendored upstream<br />- removed most files in the files/ director=
y whereas those are already present in upstream salt/conf and salt/pkg dire=
ctories<br /><br />After uploading the patch I've noticed that as a result =
of the changes in do_install_append(), the following config files are no lo=
nger installed automatically to /etc/salt/<br />- cloud<br />- roster<br />=
- cloud.conf.d<br />- cloud.profiles.d<br />- cloud.providers.d<br /><br />=
I could add back the above config files and upload a new patch, but I think=
 I'll wait on feedback before uploading a new patch.<br /><br />I'd be happ=
y as well if someone else picked up from where I left off :)

--BpFOqgBZyEgf811lp0V2--
