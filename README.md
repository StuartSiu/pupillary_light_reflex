## A Model for Pupillary Light Reflex with Constant Luminosity

Course: Math 461 Summer2016, Simon Fraser University

Team Members: Stuart Siu, Chris Kim, Eric Yu 
	
## Overview	

The pupillary light reflex is an involuntary biological response where the iris adjusts the pupil size to regulate the amount of visible light entering the eye. However, when a continuous, thin light beam is directed at the edge of the pupil in a completely dark room, a biological glitch occurs: the pupil constantly constricts to block the light, then dilates when in darkness, creating a continuous oscillation. 
This project develops a mathematical model to reproduce and analyze this pupillary oscillation. 
	
## Mathematical Model

The core of the model revolves around a delay differential equation. The primary factor causing the oscillation is the neurotransmission delay—the time it takes for the light stimulus to travel through the neural pathway to the midbrain and send a feedback response back to the iris muscles. 

- Rate of Change: The rate of change of the pupil radius over time, $\frac{dR}{dt}$, is modeled to depend linearly on the light received $L$ at a delayed time $t - \tau$. 
- Luminosity Function $L(R)$: Initially, a hyperbolic tangent function ($\tanh$) is used as a smooth, continuously differentiable approximation to map the pupil radius to the corresponding light passing through it.

<img width="25%" alt="image" src="https://github.com/user-attachments/assets/70dfb2ca-7c58-4e47-8fd8-08bb6ba12947" />
 
- Geometric Augmentation: The model is further augmented by calculating the exact intersection area of two circles - one representing the pupil and the other representing the cross-section of light beam - to make the luminosity mapping more physically realistic.

<img width="50%" alt="image" src="https://github.com/user-attachments/assets/8c66550f-f097-4d68-8ee8-1c2614539d40" />
	
## Methodology & Code
Because the resulting non-linear first-order delay differential equation cannot be easily solved analytically, the model is evaluated numerically. 
- Numerical Method: The Forward Euler method is utilized to step through time. 
- Implementation: The simulation and subsequent data visualizations were scripted using MATLAB. 
	
## Key Findings
- Delay is the Driver: When the delay time $\tau$ is zero, the pupil radius simply decays to a steady, comfortable state. The introduction of a delay time ($\tau > 0$) forces the rate of change to act on past radius data, pushing the pupil past its comfortable threshold and initiating the permanent oscillation.

	<img width="40%" alt="image" src="https://github.com/user-attachments/assets/1442ca3a-6801-4770-848b-4fc7a0bc1ef6" />

- Critical Thresholds: If the delay is small enough (e.g., $\tau = 0.1$), the oscillations eventually dampen and converge. If the delay is excessively large, the oscillations exceed biologically relevant bounds.

  	<img width="40%" alt="image" src="https://github.com/user-attachments/assets/61e42712-3459-4974-a1c6-bc9ba5417ed1" />
  	<img width="40%" alt="image" src="https://github.com/user-attachments/assets/47de4485-fdab-40dd-8965-6ea365543b3e" />

- Skewed Oscillations: If the maximum light emitted by the source ($l_m$) exceeds the "suitable" light intensity for the eye ($l_s$), the resulting oscillations become skewed and exhibit a longer period.  

	<img width="40%" alt="image" src="https://github.com/user-attachments/assets/0e010176-d0d0-4448-9e1b-25e2c708fa36" />

- Cross-section of Light Beam: The luminous flux of a circular beam passing through the pupil may bound the rate of change of the pupil size, resulting a skewed but less dramatic oscillation.

	<img width="34%" alt="image" src="https://github.com/user-attachments/assets/1d4be4f0-0236-4365-90af-f96543e8b7eb" />
  	<img width="40%" alt="image" src="https://github.com/user-attachments/assets/d0029039-849b-4042-bf33-a35608f5bfff" />




