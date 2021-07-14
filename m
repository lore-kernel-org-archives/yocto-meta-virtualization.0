Subject: Fetcher failure in crun recipe #meta-virtualization #yocto
To: meta-virtualization@lists.yoctoproject.org
From: "Mitch Gaines" <gainesmitch2@gmail.com>
X-Originating-Location: Billerica, Massachusetts, US (71.174.61.89)
X-Originating-Platform: Linux Chrome 91
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 14 Jul 2021 11:23:59 -0700
Message-ID: <b3xa.1626287039521799092.2tI6@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="5WVTZdWxS9SIAJSYaKw6"

--5WVTZdWxS9SIAJSYaKw6
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi there,

I have run into a bit of an issue with the crun recipe on the dunfell bran=
ch and from my online searching, it didn't appear to be a known issue. With=
 that in mind, am I missing something that could potentially cause this?

What is peculiar about this is, from the looks of it, those URLs and revis=
ions check out as valid. So, I'm really not sure why it is failing. Do you =
think it could it be a problem with my environment? If not, please accept t=
his as my bug report :)

Thanks for the help on this.

See below:
$ bitbake crun=20
Loading cache: 100% |#####################################################=
###########################################################################=
###############################################| Time: 0:00:00
Loaded 3547 entries from dependency cache.
*NOTE* : Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           =3D "1.46.0"
BUILD_SYS            =3D "x86_64-linux"
NATIVELSBSTRING      =3D "universal"
TARGET_SYS           =3D "arm-poky-linux-gnueabi"
MACHINE              =3D "orange-pi-plus2e"
DISTRO               =3D "poky"
DISTRO_VERSION       =3D "3.1.9"
TUNE_FEATURES        =3D "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           =3D "hard"
meta                =20
meta-poky            
meta-yocto-bsp       =3D "dunfell:10763296f84b8b1292d1dbaaac8e682592388d1b=
"
meta-sunxi           =3D "dunfell:f367a1ff2c329c801659c6de77910456a4167430=
"
meta-oe              
meta-filesystems    =20
meta-python          
meta-networking      
meta-perl            =3D "dunfell:7bd47ef6c98323c95a9e527129dca98c9a65ee08=
"
meta-virtualization  =3D "dunfell:bf2930c69b163af0ece08cae2649afffa5b3e810=
"
meta-security        =3D "dunfell:6466c6fb02f36f459b06d434484df26e083f3489=
"

Initialising tasks: 100% |################################################=
###########################################################################=
###############################################| Time: 0:00:01
Sstate summary: Wanted 443 Found 0 Missed 443 Current 220 (0% match, 33% c=
omplete)
*NOTE* : Executing Tasks
*WARNING* : oci-image-spec-v1.0.1+gitAUTOINC+bd4f8fcb09-r0 do_fetch: Faile=
d to fetch URL git://github.com/opencontainers/image-spec.git;destsuffix=3D=
git/src/github.com/opencontainers/image-spec, attempting MIRRORS if availab=
le
*ERROR* : oci-image-spec-v1.0.1+gitAUTOINC+bd4f8fcb09-r0 do_fetch: Fetcher=
 failure: Unable to find revision bd4f8fcb0979a663d8b97a1d4d9b030b3d2ca1fa =
in branch master even from upstream
*ERROR* : oci-image-spec-v1.0.1+gitAUTOINC+bd4f8fcb09-r0 do_fetch: Fetcher=
 failure for URL: 'git://github.com/opencontainers/image-spec.git;destsuffi=
x=3Dgit/src/github.com/opencontainers/image-spec'. Unable to fetch URL from=
 any source.
*ERROR* : Logfile of failure stored in: /home/mitch/bin/yocto/sunxi-podman=
-demo/build/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/oci-image-spec/v1.=
0.1+gitAUTOINC+bd4f8fcb09-r0/temp/log.do_fetch.595548
*ERROR* : Task (/home/mitch/bin/yocto/sunxi-podman-demo/layers/meta-virtua=
lization/recipes-containers/oci-image-spec/oci-image-spec_git.bb:do_fetch) =
failed with exit code '1'
*WARNING* : crun-0.10.2+gita43f72196f7aaf713dc997eaddd0f08612f60ac0-r0 do_=
fetch: Failed to fetch URL git://github.com/opencontainers/image-spec.git;b=
ranch=3Dmaster;name=3Dispec;destsuffix=3Dgit/libocispec/image-spec, attempt=
ing MIRRORS if available
*ERROR* : crun-0.10.2+gita43f72196f7aaf713dc997eaddd0f08612f60ac0-r0 do_fe=
tch: Fetcher failure: Unable to find revision 775207bd45b6cb8153ce218cc5935=
1799217451f in branch master even from upstream
*ERROR* : crun-0.10.2+gita43f72196f7aaf713dc997eaddd0f08612f60ac0-r0 do_fe=
tch: Fetcher failure for URL: 'git://github.com/opencontainers/image-spec.g=
it;branch=3Dmaster;name=3Dispec;destsuffix=3Dgit/libocispec/image-spec'. Un=
able to fetch URL from any source.
*ERROR* : Logfile of failure stored in: /home/mitch/bin/yocto/sunxi-podman=
-demo/build/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/crun/0.10.2+gita43=
f72196f7aaf713dc997eaddd0f08612f60ac0-r0/temp/log.do_fetch.595555
*ERROR* : Task (/home/mitch/bin/yocto/sunxi-podman-demo/layers/meta-virtua=
lization/recipes-containers/crun/crun_git.bb:do_fetch) failed with exit cod=
e '1'

Best Regards,
Mitch

--5WVTZdWxS9SIAJSYaKw6
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fo=
nt-size: small;">Hi there,</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp;</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">I have run into a bit of an issue with the crun recipe on=
 the dunfell branch and from my online searching, it didn't appear to be a =
known issue. With that in mind, am I missing something that could potential=
ly cause this?</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp;</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">What is peculiar about this is, from the looks of it, tho=
se URLs and revisions check out as valid. So, I'm really not sure why it is=
 failing. Do you think it could it be a problem with my environment? If not=
, please accept this as my bug report :)&nbsp;</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp;</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">Thanks for the help on this.</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp;</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">See below:</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">
<pre>$ bitbake crun=20
Loading cache: 100% |#####################################################=
###########################################################################=
###############################################| Time: 0:00:00
Loaded 3547 entries from dependency cache.
<strong>NOTE</strong>: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           =3D "1.46.0"
BUILD_SYS            =3D "x86_64-linux"
NATIVELSBSTRING      =3D "universal"
TARGET_SYS           =3D "arm-poky-linux-gnueabi"
MACHINE              =3D "orange-pi-plus2e"
DISTRO               =3D "poky"
DISTRO_VERSION       =3D "3.1.9"
TUNE_FEATURES        =3D "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           =3D "hard"
meta                =20
meta-poky            
meta-yocto-bsp       =3D "dunfell:10763296f84b8b1292d1dbaaac8e682592388d1b=
"
meta-sunxi           =3D "dunfell:f367a1ff2c329c801659c6de77910456a4167430=
"
meta-oe              
meta-filesystems    =20
meta-python          
meta-networking      
meta-perl            =3D "dunfell:7bd47ef6c98323c95a9e527129dca98c9a65ee08=
"
meta-virtualization  =3D "dunfell:bf2930c69b163af0ece08cae2649afffa5b3e810=
"
meta-security        =3D "dunfell:6466c6fb02f36f459b06d434484df26e083f3489=
"

Initialising tasks: 100% |################################################=
###########################################################################=
###############################################| Time: 0:00:01
Sstate summary: Wanted 443 Found 0 Missed 443 Current 220 (0% match, 33% c=
omplete)
<strong>NOTE</strong>: Executing Tasks
<span style=3D"color: #C4A000;"><strong>WARNING</strong></span>: <span sty=
le=3D"color: #C4A000;">oci-image-spec-v1.0.1+gitAUTOINC+bd4f8fcb09-r0 do_fe=
tch: Failed to fetch URL git://github.com/opencontainers/image-spec.git;des=
tsuffix=3Dgit/src/github.com/opencontainers/image-spec, attempting MIRRORS =
if available</span>
<span style=3D"color: #CC0000;"><strong>ERROR</strong></span>: <span style=
=
=3D"color: #CC0000;">oci-image-spec-v1.0.1+gitAUTOINC+bd4f8fcb09-r0 do_fet=
ch: Fetcher failure: Unable to find revision bd4f8fcb0979a663d8b97a1d4d9b03=
0b3d2ca1fa in branch master even from upstream</span>
<span style=3D"color: #CC0000;"><strong>ERROR</strong></span>: <span style=
=
=3D"color: #CC0000;">oci-image-spec-v1.0.1+gitAUTOINC+bd4f8fcb09-r0 do_fet=
ch: Fetcher failure for URL: 'git://github.com/opencontainers/image-spec.gi=
t;destsuffix=3Dgit/src/github.com/opencontainers/image-spec'. Unable to fet=
ch URL from any source.</span>
<span style=3D"color: #CC0000;"><strong>ERROR</strong></span>: <span style=
=
=3D"color: #CC0000;">Logfile of failure stored in: /home/mitch/bin/yocto/s=
unxi-podman-demo/build/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/oci-ima=
ge-spec/v1.0.1+gitAUTOINC+bd4f8fcb09-r0/temp/log.do_fetch.595548</span>
<span style=3D"color: #CC0000;"><strong>ERROR</strong></span>: <span style=
=
=3D"color: #CC0000;">Task (/home/mitch/bin/yocto/sunxi-podman-demo/layers/=
meta-virtualization/recipes-containers/oci-image-spec/oci-image-spec_git.bb=
:do_fetch) failed with exit code '1'</span>
<span style=3D"color: #C4A000;"><strong>WARNING</strong></span>: <span sty=
le=3D"color: #C4A000;">crun-0.10.2+gita43f72196f7aaf713dc997eaddd0f08612f60=
ac0-r0 do_fetch: Failed to fetch URL git://github.com/opencontainers/image-=
spec.git;branch=3Dmaster;name=3Dispec;destsuffix=3Dgit/libocispec/image-spe=
c, attempting MIRRORS if available</span>
<span style=3D"color: #CC0000;"><strong>ERROR</strong></span>: <span style=
=
=3D"color: #CC0000;">crun-0.10.2+gita43f72196f7aaf713dc997eaddd0f08612f60a=
c0-r0 do_fetch: Fetcher failure: Unable to find revision 775207bd45b6cb8153=
ce218cc59351799217451f in branch master even from upstream</span>
<span style=3D"color: #CC0000;"><strong>ERROR</strong></span>: <span style=
=
=3D"color: #CC0000;">crun-0.10.2+gita43f72196f7aaf713dc997eaddd0f08612f60a=
c0-r0 do_fetch: Fetcher failure for URL: 'git://github.com/opencontainers/i=
mage-spec.git;branch=3Dmaster;name=3Dispec;destsuffix=3Dgit/libocispec/imag=
e-spec'. Unable to fetch URL from any source.</span>
<span style=3D"color: #CC0000;"><strong>ERROR</strong></span>: <span style=
=
=3D"color: #CC0000;">Logfile of failure stored in: /home/mitch/bin/yocto/s=
unxi-podman-demo/build/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/crun/0.=
10.2+gita43f72196f7aaf713dc997eaddd0f08612f60ac0-r0/temp/log.do_fetch.59555=
5</span>
<span style=3D"color: #CC0000;"><strong>ERROR</strong></span>: <span style=
=
=3D"color: #CC0000;">Task (/home/mitch/bin/yocto/sunxi-podman-demo/layers/=
meta-virtualization/recipes-containers/crun/crun_git.bb:do_fetch) failed wi=
th exit code '1'</span>
</pre>
</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp;</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">Best Regards,</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">Mitch</div>

--5WVTZdWxS9SIAJSYaKw6--
