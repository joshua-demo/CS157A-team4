<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Task Workstation</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/lucide/0.263.1/lucide.min.css" rel="stylesheet">
    <style>
        /* Add any custom styles here */
        .modal {
            transition: opacity 0.25s ease;
        }
        .modal-active {
            overflow-x: hidden;
            overflow-y: visible !important;
        }
    </style>
</head>
<body class="min-h-screen bg-gray-100">
    <div class="p-8">
        <div class="max-w-4xl mx-auto relative">
            <!-- Fixed Navigation Bar -->
            <div class="fixed top-0 left-0 right-0 bg-white shadow-sm z-50">
                <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
                    <div class="flex items-center justify-between h-16">
                        <!-- Left side: Back button -->
                        <div class="flex items-center">
                            <a href="myTask.jsp" class="inline-flex items-center px-4 py-2 bg-white border border-gray-300 rounded-md text-sm font-medium text-gray-700 hover:bg-gray-50">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-2" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M19 12H5M12 19l-7-7 7-7"/>
                                </svg>
                                Back to Task List
                            </a>
                        </div>

                        <!-- Center: Title -->
                        <h1 class="text-xl font-bold text-gray-800">Task Manager</h1>

                        <!-- Right side: Timer and Music controls -->
                        <div class="flex items-center space-x-2">
                            <button onclick="toggleTimer()" 
                                    class="inline-flex items-center justify-center px-3 py-2 bg-blue-500 text-white rounded-md hover:bg-blue-600 text-sm">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" viewBox="0 0 24 24" fill="none" 
                                    stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <circle cx="12" cy="12" r="10"/>
                                    <polyline points="12 6 12 12 16 14"/>
                                </svg>
                                Start Timer
                            </button>
                            <button onclick="toggleMusic()" 
                                    class="inline-flex items-center justify-center px-3 py-2 bg-blue-500 text-white rounded-md hover:bg-blue-600 text-sm">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" viewBox="0 0 24 24" fill="none" 
                                    stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M9 18V5l12-2v13"/>
                                    <circle cx="6" cy="18" r="3"/>
                                    <circle cx="18" cy="16" r="3"/>
                                </svg>
                                Play Music
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="pt-24 px-8">
                <div class="max-w-4xl mx-auto">
                    <!-- Main Card -->
                    <div class="bg-white rounded-lg shadow-md overflow-hidden">
                        <!-- Card Header -->
                        <div class="p-6 border-b border-gray-200">
                            <div class="flex justify-between items-center">
                                <h2 class="text-xl font-bold text-gray-800">${task.taskName}</h2>
                                <span class="px-3 py-1 rounded-full text-sm 
                                    ${task.status eq 'Completed' ? 'bg-green-100 text-green-800' : 
                                    task.status eq 'Overdue' ? 'bg-red-100 text-red-800' : 
                                    'bg-yellow-100 text-yellow-800'}">
                                    Due: ${task.dueDate}
                                </span>
                            </div>
                        </div>

                        <!-- Card Content -->
                        <div class="p-6 space-y-6">
                            <!-- Task Description -->
                            <div>
                                <h3 class="text-lg font-semibold mb-2">Task Description</h3>
                                <form action="UpdateDescription" method="post" class="space-y-2">
                                    <input type="hidden" name="taskId" value="${task.taskId}">
                                    <textarea name="description" 
                                            class="w-full min-h-[100px] p-3 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
                                            >${task.description}</textarea>
                                    <button type="submit" 
                                            class="inline-flex items-center px-4 py-2 bg-blue-500 text-white rounded-md hover:bg-blue-600">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-2" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                            <path d="M19 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11l5 5v11a2 2 0 0 1-2 2z"/>
                                            <polyline points="17 21 17 13 7 13 7 21"/>
                                            <polyline points="7 3 7 8 15 8"/>
                                        </svg>
                                        Update Description
                                    </button>
                                </form>
                            </div>

                            <!-- Notes Section -->
                            <div>
                                <h3 class="text-lg font-semibold mb-2">Notes</h3>
                                <form action="UpdateNotes" method="post" class="space-y-2">
                                    <input type="hidden" name="taskId" value="${task.taskId}">
                                    <textarea name="quickNote" 
                                            class="w-full min-h-[100px] p-3 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
                                            placeholder="Add your notes here...">${task.quickNote}</textarea>
                                    <button type="submit" 
                                            class="inline-flex items-center px-4 py-2 bg-blue-500 text-white rounded-md hover:bg-blue-600">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-2" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                            <path d="M19 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11l5 5v11a2 2 0 0 1-2 2z"/>
                                            <polyline points="17 21 17 13 7 13 7 21"/>
                                            <polyline points="7 3 7 8 15 8"/>
                                        </svg>
                                        Update Notes
                                    </button>
                                </form>
                            </div>

                            <!-- Resources Section -->
                            <div>
                                <div class="flex justify-between items-center mb-2">
                                    <h3 class="text-lg font-semibold">Resources</h3>
                                    <button onclick="toggleResourceModal()" 
                                            class="inline-flex items-center px-4 py-2 border border-gray-300 rounded-md text-sm font-medium text-gray-700 bg-white hover:bg-gray-50">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-2" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                            <line x1="12" y1="5" x2="12" y2="19"/>
                                            <line x1="5" y1="12" x2="19" y2="12"/>
                                        </svg>
                                        Add Resource
                                    </button>
                                </div>
                                
                                <!-- Resource List -->
                                <ul class="space-y-2">
                                    <c:forEach var="resource" items="${task.resources}">
                                        <li class="flex justify-between items-center">
                                            <a href="${resource.url}" target="_blank" rel="noopener noreferrer" 
                                            class="flex items-center space-x-2 text-blue-500 hover:underline">
                                                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" viewBox="0 0 24 24" fill="none" 
                                                    stroke="currentColor" stroke-width="2">
                                                    <path d="M18 13v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h6"/>
                                                    <polyline points="15 3 21 3 21 9"/>
                                                    <line x1="10" y1="14" x2="21" y2="3"/>
                                                </svg>
                                                <span>${resource.displayText}</span>
                                            </a>
                                            <form action="ResourceServlet" method="post" class="inline">
                                                <input type="hidden" name="action" value="delete">
                                                <input type="hidden" name="taskId" value="${task.taskId}">
                                                <input type="hidden" name="resourceId" value="${resource.id}">
                                                <button type="submit" class="text-red-500 hover:text-red-700">
                                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                                                        <path d="M18 6L6 18M6 6l12 12"/>
                                                    </svg>
                                                </button>
                                            </form>
                                        </li>
                                    </c:forEach>
                                </ul>
                                
                                <!-- Add Resource Form -->
                                <!-- Will work on adding a pdf file -->
                                <div id="resourceModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center">
                                    <div class="bg-white rounded-lg p-6 w-full max-w-md">
                                        <h3 class="text-lg font-semibold mb-4">Add Resource</h3>
                                        <form action="ResourceServlet" method="post" id="resourceForm" class="space-y-4">
                                            <input type="hidden" name="action" value="add">
                                            <input type="hidden" name="taskId" value="${task.taskId}">
                                            
                                            <div>
                                                <label for="url" class="block text-sm font-medium text-gray-700">URL</label>
                                                <input type="url" id="url" name="url" required
                                                    class="mt-1 block w-full rounded-md border border-gray-300 px-3 py-2 text-sm"
                                                    placeholder="Enter resource URL"
                                                    oninput="updateDisplayText(this.value)">
                                            </div>
                                            
                                            <div>
                                                <label for="displayText" class="block text-sm font-medium text-gray-700">
                                                    Display Text (optional)
                                                </label>
                                                <input type="text" id="displayText" name="displayText"
                                                    class="mt-1 block w-full rounded-md border border-gray-300 px-3 py-2 text-sm"
                                                    placeholder="Enter display text (defaults to URL)">
                                            </div>
                                            
                                            <div class="flex justify-end space-x-3 mt-4">
                                                <button type="button" onclick="toggleResourceModal()"
                                                        class="px-4 py-2 border border-gray-300 rounded-md text-sm font-medium text-gray-700 hover:bg-gray-50">
                                                    Cancel
                                                </button>
                                                <button type="submit"
                                                        class="px-4 py-2 bg-blue-500 text-white rounded-md hover:bg-blue-600 text-sm font-medium">
                                                    Add Resource
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Lecture note Section using google docs API  -->
                            <div>
                                <h3 class="text-lg font-semibold mb-2">Lecture Note</h3>
                                <button onclick="toggleLectureNoteForm()" 
                                        class="inline-flex items-center px-4 py-2 border border-gray-300 rounded-md text-sm font-medium text-gray-700 bg-white hover:bg-gray-50">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-2" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                        <line x1="12" y1="5" x2="12" y2="19"/>
                                        <line x1="5" y1="12" x2="19" y2="12"/>
                                    </svg>
                                    Add Lecture Note
                                </button>
                                <a href="https://docs.google.com/document/d/1_hpU_o6dFJ-cb7Me0VXwqbxiIHtj0IVyS7d7IPheR50/edit?tab=t.0">
                                    <span>CS-157A note</span>
                                </a>
                                <!-- Choose related course from course table and then link the task with the course using tasktodo table-->
                                <!-- Display the gg docs link (the lecture note from note table) if the course has any -->
                                <!-- If not then create a gg docs note based on that lecture and add it to the note table -->
                                <!-- Note table will have a reference to the course -->
                            </div>

                            <!-- Progress Section -->
                            <div>
                                <h3 class="text-lg font-semibold mb-2">Progress</h3>
                                <form action="UpdateProgress" method="post" class="space-y-4">
                                    <input type="hidden" name="taskId" value="${task.taskId}">
                                    <div class="flex justify-between">
                                        <c:forEach var="value" items="0,25,50,75,100">
                                            <div class="flex items-center space-x-2">
                                                <input type="radio" id="progress${value}" name="progress" value="${value}"
                                                    ${task.progress eq value ? 'checked' : ''} 
                                                    class="form-radio h-4 w-4 text-blue-600">
                                                <label for="progress${value}" class="text-sm text-gray-700">${value}%</label>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <div class="w-full bg-gray-200 rounded-full h-2.5">
                                        <div class="bg-blue-600 h-2.5 rounded-full transition-all duration-300 ease-in-out"
                                            style="width: ${task.progress}%"></div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>    
        </div>
    </div>

    <script>
        let isTimerRunning = false;
        let isMusicPlaying = false;

        function toggleTimer() {
            isTimerRunning = !isTimerRunning;
            const button = event.target.closest('button');
            if (isTimerRunning) {
                button.classList.replace('bg-blue-500', 'bg-red-500');
                button.classList.replace('hover:bg-blue-600', 'hover:bg-red-600');
                button.innerHTML = `
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-2" viewBox="0 0 24 24" fill="none" 
                         stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="12" cy="12" r="10"/>
                        <polyline points="12 6 12 12 16 14"/>
                    </svg>
                    Stop Timer`;
            } else {
                button.classList.replace('bg-red-500', 'bg-blue-500');
                button.classList.replace('hover:bg-red-600', 'hover:bg-blue-600');
                button.innerHTML = `
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-2" viewBox="0 0 24 24" fill="none" 
                         stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="12" cy="12" r="10"/>
                        <polyline points="12 6 12 12 16 14"/>
                    </svg>
                    Start Timer`;
            }
        }

        function toggleMusic() {
            isMusicPlaying = !isMusicPlaying;
            const button = event.target.closest('button');
            if (isMusicPlaying) {
                button.classList.replace('bg-blue-500', 'bg-red-500');
                button.classList.replace('hover:bg-blue-600', 'hover:bg-red-600');
                button.innerHTML = `
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-2" viewBox="0 0 24 24" fill="none" 
                         stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M9 18V5l12-2v13"/>
                        <circle cx="6" cy="18" r="3"/>
                        <circle cx="18" cy="16" r="3"/>
                    </svg>
                    Stop Music`;
            } else {
                button.classList.replace('bg-red-500', 'bg-blue-500');
                button.classList.replace('hover:bg-red-600', 'hover:bg-blue-600');
                button.innerHTML = `
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-2" viewBox="0 0 24 24" fill="none" 
                         stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M9 18V5l12-2v13"/>
                        <circle cx="6" cy="18" r="3"/>
                        <circle cx="18" cy="16" r="3"/>
                    </svg>
                    Play Music`;
            }
        }

        // Progress radio buttons auto-submit
        document.querySelectorAll('input[name="progress"]').forEach(radio => {
            radio.addEventListener('change', function() {
                this.closest('form').submit();
            });
        });

        // Resource Modal
        function toggleResourceModal() {
            const modal = document.getElementById('resourceModal');
            if (modal.classList.contains('hidden')) {
                // Reset form when opening
                document.getElementById('resourceForm').reset();
                modal.classList.remove('hidden');
            } else {
                modal.classList.add('hidden');
            }
        }
    
        function updateDisplayText(url) {
            const displayTextInput = document.getElementById('displayText');
            if (!displayTextInput.value || displayTextInput.value === displayTextInput.defaultValue) {
                displayTextInput.value = url;
            }
        }
    
        // Close modal when clicking outside
        document.getElementById('resourceModal').addEventListener('click', function(event) {
            if (event.target === this) {
                toggleResourceModal();
            }
        });
    
        // Prevent form submission if URL is empty
        document.getElementById('resourceForm').addEventListener('submit', function(event) {
            const urlInput = document.getElementById('url');
            if (!urlInput.value) {
                event.preventDefault();
                alert('Please enter a valid URL');
            }
        });
    </script>
</body>
</html>