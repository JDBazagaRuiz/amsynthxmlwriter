#!/bin/bash
#This script is used to create presets for the software AMSYNTH. 
#The purpose is writing the values in the prompt that the script offers
#This saves opening the xml bank file and writing there directly
#
#First define the functions
helper() {
		  echo "This script lets you add values to a preset in an Amsynth bank in a dynamic way
		  It takes 1 single argument:
		  The path of the filename which you want add a preset to.
		  "
}
writer(){
#Pick up the data for each variable
echo "Write the name you want to give to this preset"
read PRESETNAME
echo "amp_attack (AMP ATTACK)	0-15,625"
read amp_attack 
echo "amp_decay (AMP DECAY)	0-15,625"
read amp_decay 
echo "amp_sustain (AMP SUSTAIN)	0,000-1,000"
read amp_sustain 
echo "amp_release (AMP RELEASE)	0-15,625"
read amp_release 
echo "osc1_waveform (OSC1 WAVEFORM)	[0,000][1,000][2,000][3,000][4,000
](sine, square, saw, whitenoise, noise & hold)"
read osc1_waveform 
echo "filter_attack (FILTER ATTACK)	0,000-15,625"
read filter_attack 
echo "filter_decay (FILTER DECAY)	0,000-15,625"
read filter_decay 
echo "filter_sustain (FILTER SUSTAIN)	0,000-1,000"
read filter_sustain 
echo "filter_release (FILTER RELEASE)	0,000-15,625"
read filter_release 
echo "filter_resonance (FILTER RESONANCE)	0,000-0,970"
read filter_resonance 
echo "filter_env_amount (FILTER ENVELOPE AMOUNT)	-16,000-16,000"
read filter_env_amount 
echo "filter_cutoff (FILTER CUTOFF)	0,250-64,000"
read filter_cutoff 
echo "osc2_detune (OSC2 DETUNE)	0,800-1,250"
read osc2_detune 
echo "osc2_waveform (OSC2 WAVEFORM)	0-4 (sine,square,saw,whitenoise,noise sample)"
read osc2_waveform 
echo "master_vol (AMP VOLUME)	0,000-1,000"
read master_vol 
echo "lfo_freq (LFO SPEED)	0,000-56,250"
read lfo_freq 
echo "lfo_waveform (LFO WAVEFORM)	[0,000][1,000][2,000][3,000][4,000]	(sine,square,saw,whitenoise,noise sample)"
read lfo_waveform 
echo "osc2_range (OSC2 OCTAVE)	[0,500][1,000][2,000][4,000] (-1, 0, +1, +2)"
read osc2_range 
echo "osc_mix (MIX BETWEEN OSC)	0,000-1,000"
read osc_mix 
echo "freq_mod_amount (LFO TO OSC)	-1,000-1,000"
read freq_mod_amount 
echo "filter_mod_amount (LFO TO FILTER)	-1,000-1,000"
read filter_mod_amount 
echo "amp_mod_amount (LFO TO AMP)	-1,000-1,000"
read amp_mod_amount 
echo "osc_mix_mode (RING MODE)	[0,000]-[1,000]"
read osc_mix_mode 
echo "osc1_pulsewidth (SHAPE)	0,000-1,000"
read osc1_pulsewidth 
echo "osc2_pulsewidth (SHAPE)	0,000-1,000"
read osc2_pulsewidth 
echo "reverb_roomsize (REVERB SIZE)	0,000-1,000"
read reverb_roomsize 
echo "reverb_damp (REVERB DAMPING)	0,000-1,000"
read reverb_damp 
echo "reverb_wet (REVERB AMOUNT)	0,000-1,000"
read reverb_wet 
echo "reverb_width (REVERB STEREO)	0,000-1,000"
read reverb_width 
echo "distortion_crunch (AMP DRIVE) 0,000-0,900"
read distortion_crunch 
echo "osc2_sync (SYNC TO OSC1)	[0,000]-[1,000] (no values in between)"
read osc2_sync 

#Write the variable data to each field in the xml file
echo "
<preset> <name> $PRESETNAME
<parameter> amp_attack $amp_attack
<parameter> amp_decay $amp_decay
<parameter> amp_sustain $amp_sustain
<parameter> amp_release $amp_release
<parameter> osc1_waveform $osc1_waveform
<parameter> filter_attack $filter_attack
<parameter> filter_decay $filter_decay
<parameter> filter_sustain $filter_sustain
<parameter> filter_release $filter_release
<parameter> filter_resonance $filter_resonance
<parameter> filter_env_amount $filter_env_amount
<parameter> filter_cutoff $filter_cutoff
<parameter> osc2_detune $osc2_detune
<parameter> osc2_waveform $osc2_waveform
<parameter> master_vol $master_vol
<parameter> lfo_freq $lfo_freq
<parameter> lfo_waveform $lfo_waveform
<parameter> osc2_range $osc2_range
<parameter> osc_mix $osc_mix
<parameter> freq_mod_amount $freq_mod_amount
<parameter> filter_mod_amount $filter_mod_amount
<parameter> amp_mod_amount $amp_mod_amount
<parameter> osc_mix_mode $osc_mix_mode
<parameter> osc1_pulsewidth $osc1_pulsewidth
<parameter> osc2_pulsewidth $osc2_pulsewidth
<parameter> reverb_roomsize $reverb_roomsize
<parameter> reverb_damp $reverb_damp
<parameter> reverb_wet $reverb_wet
<parameter> reverb_width $reverb_width
<parameter> distortion_crunch $distortion_crunch
<parameter> osc2_sync $osc2_sync
" >> $FILEDIT
}
#
#Start running
#If there are no arguments, print the help
if [ $# == 0 ];then
		  helper
		  exit 0
#The first argument given will be the file that contains the bank to edit.
#If that file does not exist, create it
else
		  FILEDIT=$1
		  if [ -z "$FILEDIT" ];then
		  touch "$FILEDIT"
		  fi
fi
writer $FILEDIT
echo "$FILEDIT" holds the preset you just created. 
